Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA133065D
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529800; cv=none; b=uIP1LLxWyGHWZaguxFGILF6TPkZHxFQ9EWs/Jy3v+Jb7plhbd1XvxDWVvIf/AXN4Z/FXg1WNfRvO3U7Ct1DEbCiLYfu0kuMLoPctiCdNT6esXul6VxpcVE87wAxHTNw+vvl2n67POU+K1kpyDkCZYAcMZN51iZ2227vy4oei5GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529800; c=relaxed/simple;
	bh=4wBQ1GFqEhYALlZnxrUSZv6xiHsNIhzmK2PlRNDKuG0=;
	h=Message-ID:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Date:Subject; b=Bchzu4fp0nH4Sr4xoOB11XETWRK0oyr/x03qLD+RfFnlV+KAxG/YpAn4LTtlIjbFSG3f233/UjSiQCaTPBlKFM/st+mhwH7nKPTWkmjnRIhmJ/zXxlilcMDSfs9rpHyp9nAjog85JFr9/AkYuMbJE2IZA+9mtKvnHBKmYsT+M9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTxb+hvJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTxb+hvJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so22714265ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781529799; x=1782134599; darn=vger.kernel.org;
        h=subject:date:references:in-reply-to:cc:to:from
         :content-transfer-encoding:mime-version:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wBQ1GFqEhYALlZnxrUSZv6xiHsNIhzmK2PlRNDKuG0=;
        b=lTxb+hvJPjdZhbVybszxg6vjGGKCOaeCpu4mszy7EpCUy+JWGGBD7Q0XFXEoJJcm6q
         hm6Alhbfq/unfCYY18mxOPVatDbp6xYTmrxP8YNkv2AwhkYXnCFUrMowLfKS+Wwttnqc
         6Wn907O9F9DR8jv3DDT8UawEfaqsMxD4csPryQclRa6w8qY6tsQX+Ih39rk9i1p+xkHM
         LWbuFmxwhwIBYk4YVGa3A1rQNJ8axOaniNeONDWh9DtUYNto/SDxNHpnU/CrDTIGg07b
         BT6XjJ+NM2U2nlA7R0PADuYXBJWc3qXIBg1WfO0Ddt3n7jNIFJbDS3Lf1pRjYtQXRN8E
         npNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529799; x=1782134599;
        h=subject:date:references:in-reply-to:cc:to:from
         :content-transfer-encoding:mime-version:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wBQ1GFqEhYALlZnxrUSZv6xiHsNIhzmK2PlRNDKuG0=;
        b=XOkjhfyyCVYmj12pbwl7kpsYYBG/OuaNeK5I69JWIBsQ3hqMXyU1jWP/TUdU8McGom
         jDFVptGrmeJWOc0a1+wnGqQG6enEvQyA6EbD8qBvkWSmMZGCqbGRhxrs7FFcSPPGZy75
         bgfgXmc/5vRf7a8G7eYlpX+RAkW9kS5MdYqH3fzuWxu+4Hv1lJsVNC44/VJDnBQ+1els
         HNWpr4WOSFl9EnOzzrnoT/AVrToUpCZovES9YQjGPMXM9XmKmB+L4NSIvPHjLIYG866W
         D8h4q1Px6ZYLKx/LgUq6Wc/DMVvwv3s+fXUHlT2YzJBSwnOgqbucZmY09Z2FEAIAU942
         x+FA==
X-Gm-Message-State: AOJu0YypliilmxMfBfFPW2k5hnog71Opqol7WcrINusQKlsXYlccmpPt
	ptgAGNEP1qNNu2nBEKSA+0Y4XhdWp3H/v3XmpaeoAZwTSXDvt/c77NwFb/hLce7+RjHpyg==
X-Gm-Gg: Acq92OE9pQzujKcrs6KZBabZ2rguIsK2aAgWTh0WQ75LD1QDvg4UE/OjF6BfSbwuHyw
	2DDWqOF3y2WsXyodz7j2JVSBvFCT5ZHkJtAHOjnfb2j+DFX9s0x1yOrGAGZDvjdpkFf+mxUEAie
	5ZTGQMU+NcIG/wKbhygoxz2XHW/cXCVZqvllwsFQTou5aPU0ZIixwheYpjPifSh7YpO0e1Qlbwx
	l7sg/cXA0hvnIwi7dF1T2IXSVo4QsNdXtYd7ADU73PAeK/VY6mkJNqeaRGi/PidHoWa8YHS7gDo
	N2LBdNsWSh3zp8bqh3yBRXthXID/qei/EfEvfqIFwLDpAysZ+AFot0kwA38QkRxwtmHDff+KfBb
	wNFCXU+TNyqUSPu4Xzc4sygPqAm5Bi39tDkBUdFGGY6NVgJMDetTF7aL79EHlxfmCz7ZH3sSsGZ
	1zLCmZt2SGayJF778Ie/U=
X-Received: by 2002:a17:903:2c0c:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2c66417d194mr118336795ad.16.1781529798992;
        Mon, 15 Jun 2026 06:23:18 -0700 (PDT)
Received: from [127.0.1.1] ([58.240.122.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433844a70sm96638305ad.84.2026.06.15.06.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:23:18 -0700 (PDT)
Message-ID: <6a2ffcc6.2afc2531.35ffc5.cfba@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Wayen Yan <win847@gmail.com>
To: mikhail.kshevetskiy@iopsys.eu
Cc: linux-gpio@vger.kernel.org, lorenzo@kernel.org
In-Reply-To: <20260606020342.1256509-7-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-7-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 15 Jun 2026 21:23:14 +0800
Subject: Re: [06/11] pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1 pin function

T24gMjAyNi0wNi0wNiwgTWlraGFpbCBLc2hldmV0c2tpeSB3cm90ZToKPiBwaHk0X2xlZDEgcGlu
IGZ1bmN0aW9uIG1hcHMgbGVkIGluY29ycmVjdGx5LiBJdCB1c2VzIHRoZSBzYW1lIG1hcCBhcwo+
IHBoeTNfbGVkMS4gUEhZe1h9IHNob3VsZCBtYXAgdG8gTEFOe059X1BIWV9MRURfTUFQKFgtMSku
Cj4gCj4gRml4ZXM6IDNmZmViMTdhOWEyNyAoInBpbmN0cmw6IGFpcm9oYTogYWRkIHN1cHBvcnQg
Zm9yIEFpcm9oYSBBTjc1ODMgUElOcyIpCgpIaSBNaWtoYWlsLAoKVGhhbmtzIGZvciB0aGlzIGZp
eCBzZXJpZXMuIEkgbm90aWNlZCB0aGF0IHRoZSBzYW1lIE1BUCgyKSBidWcgYWxzbwpleGlzdHMg
aW4gdGhlIEVONzU4MSBwaHk0X2xlZDEgdGFibGUsIG5vdCBqdXN0IEFONzU4My4KCkluIGRyaXZl
cnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLWFpcm9oYS5jOgoKRU43NTgxIHBoeTRfbGVkMV9m
dW5jX2dyb3VwW10gYWxzbyB1c2VzIExBTipfUEhZX0xFRF9NQVAoMikg4oCUIGlkZW50aWNhbAp0
byBwaHkzX2xlZDEuIFNob3VsZCBiZSBNQVAoMykgZm9sbG93aW5nIHRoZSBQSFl7WH0gLT4gTUFQ
KFgtMSkgcnVsZToKCiAgQUlST0hBX1BJTkNUUkxfUEhZX0xFRDEoImdwaW80MyIsIC4uLiwgTEFO
MF9QSFlfTEVEX01BUCgyKSksICAvLyBFTjc1ODEKICBBSVJPSEFfUElOQ1RSTF9QSFlfTEVEMSgi
Z3BpbzQ0IiwgLi4uLCBMQU4xX1BIWV9MRURfTUFQKDIpKSwgIC8vIEVONzU4MQogIEFJUk9IQV9Q
SU5DVFJMX1BIWV9MRUQxKCJncGlvNDUiLCAuLi4sIExBTjJfUEhZX0xFRF9NQVAoMikpLCAgLy8g
RU43NTgxCiAgQUlST0hBX1BJTkNUUkxfUEhZX0xFRDEoImdwaW80NiIsIC4uLiwgTEFOM19QSFlf
TEVEX01BUCgyKSksICAvLyBFTjc1ODEKCkNvdWxkIHlvdSBpbmNsdWRlIEVONzU4MSBpbiB0aGlz
IGZpeCBhcyB3ZWxsPwoKUmVnYXJkcywKV2F5ZW4K
