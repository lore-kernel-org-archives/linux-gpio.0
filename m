Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810169;
	b=jquzL0iz5/Cu5xOY5CheQQnZ9aJxDwqfo3a2JbAwMiyzr6+OfQgR41h+4zo5UA00cKwg
	 r0ohSqbRQ76U1saJc6FwQu/E+oLuLsWB4hSJ0WO9zreEKhMVkSrbG9Rm2xzDZmRfls3tC
	 M2I/2ev9kt2Gq8TWPiMJMhwMCTA5fK2uYu8b5cwzjtl8RVYIn+lsBdX6nkjVeg4FpANeV
	 E4tDiYjKGDYUXnacPBMZBPD4fU0/yNAK0pJlRn2fTNeIGxUba4zV1ecCaZjL7SAPwF+/c
	 uOQJedZYGR6gVeAXs/bGwTGPuEGLHLHa/wVQO6wWEidYt21Wr5Isnl6/hG1/d0dr7nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eFtBGJCac2mU4gzMuEFLnWO2dv/2wJCX7JUpFzZjIVY=;
	b=dWZbxf6RME0ddNIt+rMG29cK0Ohlmp+O959uQAmFMOgr5W9x5xe+KiidF6C4cAGKG0EF
	 dWchwdQRpma5saE7INTWVyzizsOe64MsX5B7CWNfkI/U/5ZbjhL/dptSVFO9Ccd7Fs7TH
	 /W1FsP/nzw7kI5uAldzM+zOq/kmhcUkiambWvU0D7YhtpFZtd5sPvNu0GoZr7+A56c+PZ
	 vor6iEW3K3+bq9YmLTDSsP5LZ1mZJbfstNr/WnAj+Qr2HMEg0qXCpfqTh8uPJqjpRs+Em
	 F0O+L1JSNTr/jsg3fQXVh4N4BODVQrTGfgb9c8FZghP4U1P55oVzLiqL1CjplPpY9VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqx08XWn;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24551606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24551606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqx08XWn
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-70b875f6f13so6334106eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 12:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810168; x=1796414968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtBGJCac2mU4gzMuEFLnWO2dv/2wJCX7JUpFzZjIVY=;
        b=Cqx08XWn6QzVedujOsRjW/Hs4JxyKp96uzXH9nHy1jtflOPSwxphsSqBvMk8hVXNeS
         2eEB7Cc8cId/Vzj/+KL9SImZ7WLxSoOU2SkvEgQWfDEArpu5E2gBVu0BETrUKadIBON7
         xI8muDcscw+B9K2dpk9WfWwIE07VrhiPJGpWy+txI4kcn28TDCcIoRxu0xt0ZT6f3Wsy
         OejGITNQG19TCJ+NhgZgqIc0JBuzhwwc3VWKZxAJ0ccaP6pjTAx6txzk2bQtM8ZzsfCL
         1a9ug7/8XtAcmY/89mma019OYj4jrHQSV7sbaEv1XRTSDB1y/0ZT/e8xyrYmQkiEeDwP
         vytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810168; x=1796414968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtBGJCac2mU4gzMuEFLnWO2dv/2wJCX7JUpFzZjIVY=;
        b=Z+KKkT9Cbde42ZzJYiJTLhLykg7jX31MsqMkDS1xG0wnQaquBLyhH2RHsOC9tIe27N
         itze7I5kbgvw+73gCcp6ZdZFGq0QJu/EWm1BNSMeePOR6xwcKw/XwC63z8UE2e5uaNfV
         tOq3wBk8g6gZU2BSAYivQdj8iOe9EjM3b/hpTU6qxp1CuJJUCDV0i5m8L3iWFMawglKG
         kKSrh/rMaxmONbHbv5o1mMcF16AGX346V3U/66cyrtDT4nenZRmOz58c/056XO7a1pft
         WkfMiCDfjWy/ksTA1wolkJUOgF9v9fyr08k/8s2+VoLWSk6fXw6DK/v1G1mlHHX2EcsF
         7Xkg==
X-Forwarded-Encrypted: i=1; AL+hErEi6pBGY4L/+8JWNeM9JX/AuxNs6ZgemBsrWcdRejlajX/QzdrprLs7yQ9876Hejcbag1gE1prw7Qwj@vger.kernel.org
X-Gm-Message-State: APuU4Z+uuBwTNIEuMdLEQRtkmPZnO/d6P3xabSLv0+rpBXqX333Rs+8Z
	VUVOcWUJ9Mrp/XKjPcNYBAEhXxv+wIf3IYWXmusOftwRojLsNNcytGiZxE8H19xr
X-Gm-Gg: AZFdTZepI6wkWzDLks1B7kj0FVDrbpInEVP5cVCgRSNnhCQ7iGztUw4NzPBW9ys9OnS
	etedrU0m2kThiMQGkQoHeuOpWmT28E4TeG6lH78pbD4C7yEhgRH+C9+pl0Rlm9vR3DSWJ5gj8Ox
	DGUVv2JfLgCnOQ7KhgINrBx2MbUdlTdNJI2vpoYm3rkvoN1CYi+bd3wyW3FNt6eWLDYjf4WkunK
	4Xq3r5ckd5fIti4dop13KTkF0cvId22jlIZ9n+99Vtl0K2mN6mpD3LesVAlFRjg7Zg/pBEFPOQk
	2sj2X75ietzT4VXSoQC12RK/Hbe3CbaQH/1ghhBSscKqq1B274KUKYchgbmlOjDNqMbTJ2YZvEA
	rtKdl9EviqCZVyixSklEr3hpqOky4dX6UjS8hlOmL62EfRRC+Xee2SCAXHBjNdgT0+SaUbEin15
	FOqTEuXWy1UDa0XqtDozjvQqrdRFhTibt8rOiY51dKUslF0TubxiBHmX9uXAGhcAAtjVJYg4JV7
	NDK4zk07Wgb0/dpIH7rCYLL+gii3LHe7YgivGrLLkySY6/1x+9gjqbo1iw7JCcfwaqc0WYqpk6i
	M15UyUZ7bKkQvvL6+9Fa3h4r026y0Q==
X-Received: by 2002:a05:6820:83c1:10b0:71a:e761:6995 with SMTP id 006d021491bc7-71b394d6033mr15209770eaf.30.1795810168080;
        Fri, 27 Nov 2026 12:09:28 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:09:26 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Sat, 28 Nov 2026 04:08:30 +0800
Subject: [PATCH v4 1/5] pinctrl: tigerlake: add ish_uart0 groups and
 functions for INTC1055
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-1-029071f417d5@gmail.com>
References: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
In-Reply-To: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add ish_uart0 pin groups & functions in tgllp_soc_data for device id
INTC1055. The pinctrl-upboard driver set the correct pin function
corresponding to these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 93234f4a9bd0..93479695bb22 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -333,6 +333,7 @@ static const unsigned int tgllp_i2c0_pins[] = { 5, 6 };
 static const unsigned int tgllp_i2c1_pins[] = { 7, 8 };
 static const unsigned int tgllp_pwm0_pins[] = { 99 };
 static const unsigned int tgllp_uart1_pins[] = { 85, 86, 87, 88 };
+static const unsigned int tgllp_ish_uart0_pins[] = { 112, 113, 114, 115 };
 static const unsigned int tgllp_ssp2_pins[] = { 108, 109, 110, 111 };
 
 static const struct intel_pingroup tgllp_groups[] = {
@@ -340,6 +341,7 @@ static const struct intel_pingroup tgllp_groups[] = {
 	PIN_GROUP("i2c1_grp", tgllp_i2c1_pins, 2),
 	PIN_GROUP("pwm0_grp", tgllp_pwm0_pins, 2),
 	PIN_GROUP("uart1_grp", tgllp_uart1_pins, 2),
+	PIN_GROUP("ish_uart0_grp", tgllp_ish_uart0_pins, 2),
 	PIN_GROUP("ssp2_grp", tgllp_ssp2_pins, 7),
 };
 
@@ -347,6 +349,7 @@ static const char * const tgllp_i2c0_groups[] = { "i2c0_grp" };
 static const char * const tgllp_i2c1_groups[] = { "i2c1_grp" };
 static const char * const tgllp_pwm0_groups[] = { "pwm0_grp" };
 static const char * const tgllp_uart1_groups[] = { "uart1_grp" };
+static const char * const tgllp_ish_uart0_groups[] = { "ish_uart0_grp" };
 static const char * const tgllp_ssp2_groups[] = { "ssp2_grp" };
 
 static const struct intel_function tgllp_functions[] = {
@@ -354,6 +357,7 @@ static const struct intel_function tgllp_functions[] = {
 	FUNCTION("i2c1", tgllp_i2c1_groups),
 	FUNCTION("pwm0", tgllp_pwm0_groups),
 	FUNCTION("uart1", tgllp_uart1_groups),
+	FUNCTION("ish_uart0", tgllp_ish_uart0_groups),
 	FUNCTION("ssp2", tgllp_ssp2_groups),
 };
 

-- 
2.43.0

