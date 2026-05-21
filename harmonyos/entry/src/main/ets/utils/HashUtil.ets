export class HashUtil {
  static utf8Bytes(text: string): number[] {
    const bytes: number[] = [];
    for (let i = 0; i < text.length; i++) {
      let code = text.charCodeAt(i);
      if (code < 0x80) {
        bytes.push(code);
      } else if (code < 0x800) {
        bytes.push(0xC0 | (code >> 6), 0x80 | (code & 0x3F));
      } else if (code >= 0xD800 && code <= 0xDBFF && i + 1 < text.length) {
        const next = text.charCodeAt(++i);
        code = 0x10000 + (((code & 0x3FF) << 10) | (next & 0x3FF));
        bytes.push(0xF0 | (code >> 18), 0x80 | ((code >> 12) & 0x3F), 0x80 | ((code >> 6) & 0x3F), 0x80 | (code & 0x3F));
      } else {
        bytes.push(0xE0 | (code >> 12), 0x80 | ((code >> 6) & 0x3F), 0x80 | (code & 0x3F));
      }
    }
    return bytes;
  }

  static hex(bytes: number[]): string {
    return bytes.map((value) => (value & 0xFF).toString(16).padStart(2, '0')).join('');
  }

  static md5Text(text: string): string {
    return HashUtil.md5Bytes(HashUtil.utf8Bytes(text));
  }

  static md5Buffer(buffer: ArrayBuffer): string {
    return HashUtil.md5Bytes(Array.from(new Uint8Array(buffer)));
  }

  static sha256Text(text: string): string {
    return HashUtil.sha256Bytes(HashUtil.utf8Bytes(text));
  }

  private static add32(a: number, b: number): number {
    return (a + b) & 0xFFFFFFFF;
  }

  private static rol(num: number, cnt: number): number {
    return (num << cnt) | (num >>> (32 - cnt));
  }

  private static cmn(q: number, a: number, b: number, x: number, s: number, t: number): number {
    return HashUtil.add32(HashUtil.rol(HashUtil.add32(HashUtil.add32(a, q), HashUtil.add32(x, t)), s), b);
  }

  private static ff(a: number, b: number, c: number, d: number, x: number, s: number, t: number): number {
    return HashUtil.cmn((b & c) | ((~b) & d), a, b, x, s, t);
  }

  private static gg(a: number, b: number, c: number, d: number, x: number, s: number, t: number): number {
    return HashUtil.cmn((b & d) | (c & (~d)), a, b, x, s, t);
  }

  private static hh(a: number, b: number, c: number, d: number, x: number, s: number, t: number): number {
    return HashUtil.cmn(b ^ c ^ d, a, b, x, s, t);
  }

  private static ii(a: number, b: number, c: number, d: number, x: number, s: number, t: number): number {
    return HashUtil.cmn(c ^ (b | (~d)), a, b, x, s, t);
  }

  private static md5Bytes(input: number[]): string {
    const bytes = input.slice();
    const bitLen = bytes.length * 8;
    const bitLenLow = bitLen >>> 0;
    const bitLenHigh = Math.floor(bitLen / 0x100000000) >>> 0;
    bytes.push(0x80);
    while ((bytes.length % 64) !== 56) {
      bytes.push(0);
    }
    for (let i = 0; i < 4; i++) {
      bytes.push((bitLenLow >>> (8 * i)) & 0xFF);
    }
    for (let i = 0; i < 4; i++) {
      bytes.push((bitLenHigh >>> (8 * i)) & 0xFF);
    }

    let a = 0x67452301;
    let b = 0xEFCDAB89;
    let c = 0x98BADCFE;
    let d = 0x10325476;

    for (let i = 0; i < bytes.length; i += 64) {
      const x: number[] = [];
      for (let j = 0; j < 16; j++) {
        const offset = i + j * 4;
        x[j] = bytes[offset] | (bytes[offset + 1] << 8) | (bytes[offset + 2] << 16) | (bytes[offset + 3] << 24);
      }
      const oldA = a;
      const oldB = b;
      const oldC = c;
      const oldD = d;

      a = HashUtil.ff(a, b, c, d, x[0], 7, -680876936);
      d = HashUtil.ff(d, a, b, c, x[1], 12, -389564586);
      c = HashUtil.ff(c, d, a, b, x[2], 17, 606105819);
      b = HashUtil.ff(b, c, d, a, x[3], 22, -1044525330);
      a = HashUtil.ff(a, b, c, d, x[4], 7, -176418897);
      d = HashUtil.ff(d, a, b, c, x[5], 12, 1200080426);
      c = HashUtil.ff(c, d, a, b, x[6], 17, -1473231341);
      b = HashUtil.ff(b, c, d, a, x[7], 22, -45705983);
      a = HashUtil.ff(a, b, c, d, x[8], 7, 1770035416);
      d = HashUtil.ff(d, a, b, c, x[9], 12, -1958414417);
      c = HashUtil.ff(c, d, a, b, x[10], 17, -42063);
      b = HashUtil.ff(b, c, d, a, x[11], 22, -1990404162);
      a = HashUtil.ff(a, b, c, d, x[12], 7, 1804603682);
      d = HashUtil.ff(d, a, b, c, x[13], 12, -40341101);
      c = HashUtil.ff(c, d, a, b, x[14], 17, -1502002290);
      b = HashUtil.ff(b, c, d, a, x[15], 22, 1236535329);

      a = HashUtil.gg(a, b, c, d, x[1], 5, -165796510);
      d = HashUtil.gg(d, a, b, c, x[6], 9, -1069501632);
      c = HashUtil.gg(c, d, a, b, x[11], 14, 643717713);
      b = HashUtil.gg(b, c, d, a, x[0], 20, -373897302);
      a = HashUtil.gg(a, b, c, d, x[5], 5, -701558691);
      d = HashUtil.gg(d, a, b, c, x[10], 9, 38016083);
      c = HashUtil.gg(c, d, a, b, x[15], 14, -660478335);
      b = HashUtil.gg(b, c, d, a, x[4], 20, -405537848);
      a = HashUtil.gg(a, b, c, d, x[9], 5, 568446438);
      d = HashUtil.gg(d, a, b, c, x[14], 9, -1019803690);
      c = HashUtil.gg(c, d, a, b, x[3], 14, -187363961);
      b = HashUtil.gg(b, c, d, a, x[8], 20, 1163531501);
      a = HashUtil.gg(a, b, c, d, x[13], 5, -1444681467);
      d = HashUtil.gg(d, a, b, c, x[2], 9, -51403784);
      c = HashUtil.gg(c, d, a, b, x[7], 14, 1735328473);
      b = HashUtil.gg(b, c, d, a, x[12], 20, -1926607734);

      a = HashUtil.hh(a, b, c, d, x[5], 4, -378558);
      d = HashUtil.hh(d, a, b, c, x[8], 11, -2022574463);
      c = HashUtil.hh(c, d, a, b, x[11], 16, 1839030562);
      b = HashUtil.hh(b, c, d, a, x[14], 23, -35309556);
      a = HashUtil.hh(a, b, c, d, x[1], 4, -1530992060);
      d = HashUtil.hh(d, a, b, c, x[4], 11, 1272893353);
      c = HashUtil.hh(c, d, a, b, x[7], 16, -155497632);
      b = HashUtil.hh(b, c, d, a, x[10], 23, -1094730640);
      a = HashUtil.hh(a, b, c, d, x[13], 4, 681279174);
      d = HashUtil.hh(d, a, b, c, x[0], 11, -358537222);
      c = HashUtil.hh(c, d, a, b, x[3], 16, -722521979);
      b = HashUtil.hh(b, c, d, a, x[6], 23, 76029189);
      a = HashUtil.hh(a, b, c, d, x[9], 4, -640364487);
      d = HashUtil.hh(d, a, b, c, x[12], 11, -421815835);
      c = HashUtil.hh(c, d, a, b, x[15], 16, 530742520);
      b = HashUtil.hh(b, c, d, a, x[2], 23, -995338651);

      a = HashUtil.ii(a, b, c, d, x[0], 6, -198630844);
      d = HashUtil.ii(d, a, b, c, x[7], 10, 1126891415);
      c = HashUtil.ii(c, d, a, b, x[14], 15, -1416354905);
      b = HashUtil.ii(b, c, d, a, x[5], 21, -57434055);
      a = HashUtil.ii(a, b, c, d, x[12], 6, 1700485571);
      d = HashUtil.ii(d, a, b, c, x[3], 10, -1894986606);
      c = HashUtil.ii(c, d, a, b, x[10], 15, -1051523);
      b = HashUtil.ii(b, c, d, a, x[1], 21, -2054922799);
      a = HashUtil.ii(a, b, c, d, x[8], 6, 1873313359);
      d = HashUtil.ii(d, a, b, c, x[15], 10, -30611744);
      c = HashUtil.ii(c, d, a, b, x[6], 15, -1560198380);
      b = HashUtil.ii(b, c, d, a, x[13], 21, 1309151649);
      a = HashUtil.ii(a, b, c, d, x[4], 6, -145523070);
      d = HashUtil.ii(d, a, b, c, x[11], 10, -1120210379);
      c = HashUtil.ii(c, d, a, b, x[2], 15, 718787259);
      b = HashUtil.ii(b, c, d, a, x[9], 21, -343485551);

      a = HashUtil.add32(a, oldA);
      b = HashUtil.add32(b, oldB);
      c = HashUtil.add32(c, oldC);
      d = HashUtil.add32(d, oldD);
    }

    const out: number[] = [];
    for (const word of [a, b, c, d]) {
      out.push(word & 0xFF, (word >>> 8) & 0xFF, (word >>> 16) & 0xFF, (word >>> 24) & 0xFF);
    }
    return HashUtil.hex(out);
  }

  private static sha256Bytes(input: number[]): string {
    const k: number[] = [
      0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
      0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
      0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
      0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
      0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
      0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
      0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
      0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
    ];
    const bytes = input.slice();
    const bitLen = bytes.length * 8;
    bytes.push(0x80);
    while ((bytes.length % 64) !== 56) {
      bytes.push(0);
    }
    for (let i = 7; i >= 0; i--) {
      bytes.push((bitLen / Math.pow(2, i * 8)) & 0xFF);
    }

    let h0 = 0x6a09e667;
    let h1 = 0xbb67ae85;
    let h2 = 0x3c6ef372;
    let h3 = 0xa54ff53a;
    let h4 = 0x510e527f;
    let h5 = 0x9b05688c;
    let h6 = 0x1f83d9ab;
    let h7 = 0x5be0cd19;

    for (let i = 0; i < bytes.length; i += 64) {
      const w: number[] = new Array(64).fill(0);
      for (let j = 0; j < 16; j++) {
        const o = i + j * 4;
        w[j] = ((bytes[o] << 24) | (bytes[o + 1] << 16) | (bytes[o + 2] << 8) | bytes[o + 3]) >>> 0;
      }
      for (let j = 16; j < 64; j++) {
        const s0 = HashUtil.rotr(w[j - 15], 7) ^ HashUtil.rotr(w[j - 15], 18) ^ (w[j - 15] >>> 3);
        const s1 = HashUtil.rotr(w[j - 2], 17) ^ HashUtil.rotr(w[j - 2], 19) ^ (w[j - 2] >>> 10);
        w[j] = (((w[j - 16] + s0) >>> 0) + ((w[j - 7] + s1) >>> 0)) >>> 0;
      }
      let a = h0;
      let b = h1;
      let c = h2;
      let d = h3;
      let e = h4;
      let f = h5;
      let g = h6;
      let h = h7;
      for (let j = 0; j < 64; j++) {
        const s1 = HashUtil.rotr(e, 6) ^ HashUtil.rotr(e, 11) ^ HashUtil.rotr(e, 25);
        const ch = (e & f) ^ ((~e) & g);
        const temp1 = (h + s1 + ch + k[j] + w[j]) >>> 0;
        const s0 = HashUtil.rotr(a, 2) ^ HashUtil.rotr(a, 13) ^ HashUtil.rotr(a, 22);
        const maj = (a & b) ^ (a & c) ^ (b & c);
        const temp2 = (s0 + maj) >>> 0;
        h = g;
        g = f;
        f = e;
        e = (d + temp1) >>> 0;
        d = c;
        c = b;
        b = a;
        a = (temp1 + temp2) >>> 0;
      }
      h0 = (h0 + a) >>> 0;
      h1 = (h1 + b) >>> 0;
      h2 = (h2 + c) >>> 0;
      h3 = (h3 + d) >>> 0;
      h4 = (h4 + e) >>> 0;
      h5 = (h5 + f) >>> 0;
      h6 = (h6 + g) >>> 0;
      h7 = (h7 + h) >>> 0;
    }
    return [h0, h1, h2, h3, h4, h5, h6, h7].map((word) => word.toString(16).padStart(8, '0')).join('');
  }

  private static rotr(value: number, bits: number): number {
    return (value >>> bits) | (value << (32 - bits));
  }
}
