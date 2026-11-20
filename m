Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179754;
	b=YOdwooNN0Ne8WLmrgM0aVvG4DWAn/IteIpPFubOnlqb5+7HcieVDUvjtfDN/WqxOyFqZ
	 sboNPb8Twa9eJb6Sv6Wdr/WjSgTjOF20SCQOHEaAa81yN/YrDP/6a45hJczfowfr256Nb
	 yJJnHi7eBP9i+hDprCopuUcm383EoPPLgArrZjPTWjk75vkQHJLdZIJ+W2Q96SYVjEbGq
	 nJnQY8UBrrQLkgsydjGFXVWD/NIbKfvHSfrg+mKl1vayZJGt1ismK1UyDZW5owjZjRWbG
	 aOf+8nTLbb7P4Jo1Cg05UtXlObvOmz/D1R9s9zHgL8Bf4kFX2oaXrAotXKAVtKFP1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179754;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Sf9a1TadTPAXHY3roGFF0ghdBi+uNkgT8oVClrxeJsM=;
	b=jnrq6UrTDUNRqiesyClXi9duVKST38XyVoJCM3YeoXJmdaBcvaHAg7IPNPAZZKZW77ue
	 rIj1LicyQ3C2ggMRzwT8HsV3wY4AoLHZQTiuGW7NWQ4i90N3K4VWKqAxLCWRq3UU8j5PI
	 xNRCDyBk8+kvbolI3nfEPalCZj0+Dp8pL8wyGyoKXpKw67ATkJ5FF/bGad81UHewOT87Q
	 ve3fdJdtOJCH/ANh8fuliM4cCuCMI3trrz2BBqULcjUpAqWHk5LwBpz53l+3wCIqDY5v1
	 j/99nju6FBG/yuWn0b5goVqs23DyvC36/EBJTOrTxdOT0F/sLjNz2bR/1i8v7pJUIdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jschaer.ch;
	spf=pass smtp.mailfrom=jschaer.ch;
	dkim=pass header.d=jschaer.ch header.i=@jschaer.ch header.a=rsa-sha256 header.s=fm3 header.b=hHVPng2S;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fM90GntZ;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E484606A32A
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E484606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jschaer.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jschaer.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jschaer.ch header.i=@jschaer.ch header.a=rsa-sha256 header.s=fm3 header.b=hHVPng2S;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fM90GntZ
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 658827A0380
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 08:02:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 20 Nov 2026 08:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jschaer.ch; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1795179751; x=1795266151; bh=Sf
	9a1TadTPAXHY3roGFF0ghdBi+uNkgT8oVClrxeJsM=; b=hHVPng2SdqBv5VRO9H
	HFB7nrZ8I7Syy8fO2Xlc6VUfGWfqEW/xS5Y7NFtmvvm+XPaRC/PFcEdouWHRNW1j
	9Z+2DwMLqCfUCo3hnPG2PU/1xVCPdGWDqQfdtAQ7fyjFZSpP3k46hn1Z8K9M9rAF
	z/wEoX3Er1FGJ0D1QIDzQIQJUXfYIidE+OyATLz02tSbsyqBj+q/qgG+mIA2tJEo
	VkkLF0GlOn0l0YHOJXRYZNz3M9r8IFYV04GpG2EYEeqDc51GBNkEPvmSlTf/WDQr
	FJ/OxwmK8Q5C3x3MrGtVPPBPAe9I0atG5MKWS2V6FUsBPo5yVO5sGu9kaTVv3bIO
	HqLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1795179751; x=1795266151; bh=Sf9a1TadTPAXHY3roGFF0ghdBi+u
	NkgT8oVClrxeJsM=; b=fM90GntZbPNjkOMnf7Enp6/8+He9MA/94usCBolMpyy6
	WhNSqQFQmZDMenxhptwWELgLRqY6XQ2v4pTjPQS0A8nccI+o2yuaw6XOy9C1NiWm
	L+mziBbwH04JKb4vDHC5ldvbM1MvI6rHmaqy/EZuZI56KemR5dA3Smv0o9bCxD/N
	sbAhh/7a2O3fB3X6v3PufXI75xoPoZNhEM2MwZzBhjuE45lhG/p5hgYV9u+8/ETl
	cZLG1yeXnz4G6PIZQVqz+kIj8KvUwZOpw73aavy3JupgXsO9CKlcXgEWSU04dbSY
	Adi0TJ+ueTnZMeKO4K8ZLS2d2VzDCK0b4TP1A2OpiQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jschaer.ch a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795179751; d=jschaer.ch;
	mf=PGphbkBqc2NoYWVyLmNoPg==;
	rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:PlmL2vLre30prbjgVuKGQTTae15mK8q/vHw8moO3cfiSBp+
	ldJRrAmSHlUWNcRLxSxBOEU0RCD5fg7MOPCnYvLuH2qyOqatGkrwZ8+tG9+yiDdW
	AbhmHfh0+chz/1r1RRYmguPAOkFvLlBitV4lv+ZQEPCLK30+MTdcxsfjo1VzIvPz
	8CLRayP0c6BkTrMnUATxoU4gprvt02+1NmiO13hhRxwXToD+uLYKbk3Km1L5ZPLZ
	OePIjdgqRSbY38+aEv1YQqq2yErWkcDezge1hhVbtnJ41aTewxY990HNmwXY24bD
	RUCiplWgtlv70282MnAy/8Ipd36LLKhJ34b8Jfg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:sxkv3jZUfRs6osHl0SmSOSI5AdHa7a+LQ+6awwz6vDM=:rphMyLdZDRyhD7SlfxBjbT68Qk6TexzpLzYDzVCwHGE=;
X-ME-Sender: <xms:50QAa2dtKbKom-1TrAeJCXoOzHVyB5A6wRpT3q6me1jdsTD_Lk121g>
    <xme:50QAaxtJg8bmg7w91AJN4U-MWC3JHGbsXoXL3FrkBANqJFtIcnk-IJ8hg9sZnnIqj
    ZTPNJz2jFTyMt59UH4ncDAw7Kuc2EL5FiYfcy70rnLiPG3Rd0iqFJiX>
X-ME-Received: <xmr:50QAa3kfjn1o19-aiKb4ITfHba_WGrsBRR3hDY2aiosKcYcxk3GpIB6psiSVNspPEXEG20FNTiYcoJN-OXvEN5sgiatbpvsl3r8C>
X-ME-Proxy-Cause: dmFkZTE1d9BpAt3ZrY4MvgNAVww7WbsFfu59mGi65YVhaFr2AbFJI6+lrfaVXJkakZ5Wup
    HW3Xx+DFKxjUlYSprz+B45XNQ8OnqdxiqzfYiGOLaStaN40JUdlfHUg+YRzT+YhVM53KER
    TOchZFI5QnW8k+MGpze1+1PQJm4DXTjV07iAsTnDat6Ls/JHOIXs0klQxD+cSzRDATrZ1r
    7mtQcf0gvtEtwnzSzcFASn+j3Q9WJdID+7cqZTem+KU7wLLJ950b1Zgm19OkGlmdAu/zx1
    h3of4pxG19cAMQY1nR4/xLjF2JopZAN8PLSC/+tvWBVlI3lb44enFub2/nMDil+yeOhzCv
    4IrFs6eCSuG2Z9R7hyWB49mpzw0fwMtfOotjRClM0HHMXlN8VxHld8IMNhATheGhPcNSSG
    qml5fFKjzfWUhHlmjE8i3NVIF5mKsY0Mxp/gzx+GmuwVx35nmFnaUEA0SR5i0O0tV3HDSR
    ZGGb2r8kIt9ycCv+Ay8aK/KgAKqvvbzc4u3831qUPG74bqW96rnpBhhrRAQ6TeV6DouS3z
    /nCIF2Z79iB6+IjwwGeN+GAbRr+hRRaB2wv1uDgHDW3fVEN6Q24x/UcaCj85ul/4Fa8uOK
    a4yePEjSR9oVzDipgxAfZHMVvS0zj4jmIFZkdNwAo4tSWnpfvZ6Z1DMm60VQ
X-ME-Proxy: <xmx:50QAazx2UhtG8l2MhgeAkVy4OcvmA-eO1Cx9h1g6D9heHk9VK7R9Qg>
    <xmx:50QAa5OH3xXxXXMClYvbsdaHNH2CWT8q2avGE9lcKYEkWR1NPYq0Mg>
    <xmx:50QAa_oM8JBFpcSVwkMKYGKuXQ_ROjlwp3vjIvdFB1dcM2AK4Q7LSQ>
    <xmx:50QAayF9GW1mC87Z_oPXkxdwMXTuEWDIwqzuKr-coZ3I3EalDWNC-Q>
    <xmx:50QAa_2ye7Tc1MnaUfhzGu3t5_NfAfZVkviH_IQLP5aLdlW2YJ10cYL5>
Feedback-ID: ie67446dc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 08:02:30 -0500 (EST)
From: =?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
Subject: [PATCH] gpiolib: fix inverted trace values in gpiod_get_array_value()
Date: Fri, 20 Nov 2026 14:02:08 +0100
Message-ID: <20261120130208.89621-1-jan@jschaer.ch>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Almost all trace_gpio_value() calls report the raw value.
gpiod_get_array_value_complex() is the only exception; it reports
the logical value in traces unless the caller requests raw values.
This inconsistency makes GPIO traces confusing.

Move the trace call earlier, where the value is still raw.
Now, all GPIO traces consistently report raw values.

Fixes: eec1d566cdf9 ("gpio: Introduce ->get_multiple callback")
Signed-off-by: Jan Schär <jan@jschaer.ch>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2a220f10f0e5..c924fc65c622 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3644,10 +3644,10 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 			int hwgpio = gpiod_hwgpio(desc);
 			int value = test_bit(hwgpio, bits);
 
+			trace_gpio_value(desc_to_gpio(desc), 1, value);
 			if (!raw && test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
 				value = !value;
 			__assign_bit(j, value_bitmap, value);
-			trace_gpio_value(desc_to_gpio(desc), 1, value);
 			j++;
 
 			if (array_info)

base-commit: c6d8ebd7324cefda867a701b4341605b681aa3f5
-- 
2.53.0

