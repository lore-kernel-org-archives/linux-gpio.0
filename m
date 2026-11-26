Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706565;
	b=3shRo4r3mtbX7b99CuJzsOHpCWuNla4u+ViowGWQsgFIWCA16Ozz105IQB6Qji9pQprl
	 FZIjmPlBJnVaBuCqPmI1CyMhPSome0FAcgLbIBkM4JfbCHKQ+0QvZcie0MUafJHe2KtS6
	 qq2FhwkwSxgpggbNCPJOFqDIo0byh+8BCYQ1vtIUfwJ+pHOUtPw9pH86w1JyJ2edqY51C
	 WkQj6Ue4gwBzNtMJbWxg+xcVk7TXJsdLyxBWgRDFUCzVEE58UDdVhU0QsVt6YeHfqptiM
	 FX1Frcrqf3dNF4MukZI2zGfljEh9pts81TIom1DNQ0QxiwgFMsu4x25IFQXodMnx/zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Z21pXVuBY5SXtRs7zspjoo3gtjvUh4V57CiGDExdMRg=;
	b=X6ZqLT/gM8FYGB7Kuey3L5QwcObDm1cdUZzxkN3Cf3V6g2grq4FEajzaIECqSvAC9RUK
	 ird67N1Gvgc+AIxqiz1o7on4OAnpfA102zNXnrqHdPoBjblXTmF6QXt3YYkAXIQvpl5cp
	 XUiRNodMasK/LYp7t3yl713Re+GikA9ozkKPIsdxvxSy74Gj5wKL5mWPYQDzR6az/gXkS
	 FdRpI19lysBxTDTb6E6ty0wMxKRZK6aUhnoaidERwC2BZV5QvEK0wG5RJqI32uEf1VxlM
	 OtBjPQSnyBfRQUv/OTG9oA58wGqGNpHcqz0H5XLRR+cnrx1AmRJ1gSeuoAX3Ry2GRHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWNVKGD9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03B606A32D
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A03B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWNVKGD9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso51108135e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706564; x=1796311364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z21pXVuBY5SXtRs7zspjoo3gtjvUh4V57CiGDExdMRg=;
        b=EWNVKGD9CXCHzCbwfCidNB/ngRWbxmzwt4TD4YW21Ce3s17FJlsvHMHFa8qh0hwOSb
         PjkksecYFqBvPmWfCIbpwl/3dasm3fz1cVj3o4bMxQUPLD/oCiVwTr1l5SJ5q0M46nXG
         Tm4+5fowtKtnL+0gvG2/tAdWxONyfN3lT+xkSCcrrW5m8t2QBxRRnTrMQz7SyWmF4ubq
         bXPLi9hpW7idWl6Icwi7KPUGzHO3vzxYK5BTa4zqJ7mCBOllzHosUvK0IHGTA8GEeJTf
         fFJizC6D1Duh+LzAlxEzerVeXJfgrRslAuO1RCEHLZVpckzcFM7o6PAOeqF9XMnwY9tz
         zAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706564; x=1796311364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z21pXVuBY5SXtRs7zspjoo3gtjvUh4V57CiGDExdMRg=;
        b=FDvG2J/556t08XNJKERAEON+dbPIoLoCml6Xm5bGPtO6sE22gWOxw8nYQlCGLo8I9t
         FihWca4e/o4QC+qnyB/ZIShvMp7wKNbQiwD05llF+M1ehp0Cn9Q/aDUj14CxpqAgZ9ML
         /wpiYUHhdL6l39vTMkBiceYWujd6lg3zYOinLvOc1wLM9Pd96bqR0CJpMRtUA0FN2nGD
         xzqeQ+dgDZBzFESdLNSmMRl248MJ9RzAvdueQao37ZDhv15lAMi0pIoIn+jzhFIOGHfW
         zi1NZXMKMCyZ/a90Z3c91L94V50g7+mGQ/Xui0+cc4GxeTUFrijh+CkKbk8epQ5hbmds
         5n1A==
X-Forwarded-Encrypted: i=1; AL+hErEK19PKgOw1wBiVvUbGz+ht8AIIkGR7FxQeIgYyT7f1CZJIsG4HBPUaejBfu0CLqtRH6xnkmj3voXGQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8fazabv2s8Fbem+OUjwqQ99Ng9cm263FZHc88gPvxeNMBmkDTz
	oBp8FmxLtcx7TwIuPu2lAcXzG3ZS8CmNPyFPrSBLAIQ8PYiahgKBtRv8/D6ySA==
X-Gm-Gg: AZFdTZeqgxEvzrs05CcUuU3FZbvYuNJkPc5RfJsdzXjAEkLDwkaVMqABHtb0fChtr+X
	93OW6d3S/QsrAdmxRsgtWDpn38hbbzHSmlU7+1dbZEr15OjxwpruuXnqucaO/+yQc7x3QVtcsSE
	0JeZg9bo4/pHgNP8v3VWeB/i1G0XH7VMD6Ir0Xtc0bzkDWxcGtS5ZkLg8Q15cbuLkw8A45Rnq0F
	LyqZCM4IzMRg+hpubGUzRKr49KsfY85O5NWmgtGPNNXGC9hWMEWugvKemP7gBHZzV3k7q9BxUOx
	jOakY4v/8lR1J7NL0fewHIF6c+2Crjc9Fe2AINgwB8N9N24S/YKsur8Lsl0svYV/ba8HUqFvRcc
	hrU67iuHh4WO/kQg7wvhkcIs70lFU8hJbpJnElVhli8vB2oDhQbmO2uLwFyIYB33tNAUf6y+chR
	ro/APWPwLVp1IwzYttpuoQIAbF5oPk3+6TTm0sVymixK6j6cg9s1FZDIY/r12XR3H2h1d0UVaik
	xFii4U9FhBjNSiEXh7kp1YcEXSKS4SdeRihEIh58LUYuAdavgctON9HAMzl7v9bzOkafNj+ffvA
	2vOZDKEEjo9vBMmyWBR0ot6YStu9TakcJ38S1Q==
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr452329655e9.6.1795706563607;
        Thu, 26 Nov 2026 07:22:43 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Thu, 26 Nov 2026 15:22:33 +0000
Subject: [PATCH 2/2] pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux
 functions
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
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=4316;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=+hML+quA4x5S2tx2hPyI1jZaB0AWbKbrLEJB7RRYDfI=;
 b=EDdAeNDrR0Tlphk/msuUOArDjFqKz0nJtMgUBacMbJ2g+GuTWb1QtgdFKn72S8/tfNiPb0se+
 JUgKuOy0pPeDEcTsjaj3/48iqi8W23R+H4SJUxwGQ5xzKruseXCmpBJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the gp_mn function on gpio63 and the gp_pdm_mira and gp_pdm_mirb
functions on gpio35-37 and gpio88-90.

Qualcomm's downstream pinctrl-anorak driver does not have them. The pins
and the mux values were provided by Konrad Dybcio.

Link: https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-halliday.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-halliday.c b/drivers/pinctrl/qcom/pinctrl-halliday.c
index 05e7f22bb417..9d386bdec24c 100644
--- a/drivers/pinctrl/qcom/pinctrl-halliday.c
+++ b/drivers/pinctrl/qcom/pinctrl-halliday.c
@@ -603,6 +603,9 @@ enum halliday_functions {
 	msm_mux_gcc_gp7,
 	msm_mux_gcc_gp8,
 	msm_mux_gcc_gp9,
+	msm_mux_gp_mn,
+	msm_mux_gp_pdm_mira,
+	msm_mux_gp_pdm_mirb,
 	msm_mux_i2s0_data0,
 	msm_mux_i2s0_data1,
 	msm_mux_i2s0_sck,
@@ -920,6 +923,18 @@ static const char *const gcc_gp9_groups[] = {
 	"gpio107",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio63",
+};
+
+static const char *const gp_pdm_mira_groups[] = {
+	"gpio35", "gpio36", "gpio37",
+};
+
+static const char *const gp_pdm_mirb_groups[] = {
+	"gpio88", "gpio89", "gpio90",
+};
+
 static const char *const i2s0_data0_groups[] = {
 	"gpio163",
 };
@@ -1419,6 +1434,9 @@ static const struct pinfunction halliday_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp7),
 	MSM_PIN_FUNCTION(gcc_gp8),
 	MSM_PIN_FUNCTION(gcc_gp9),
+	MSM_PIN_FUNCTION(gp_mn),
+	MSM_PIN_FUNCTION(gp_pdm_mira),
+	MSM_PIN_FUNCTION(gp_pdm_mirb),
 	MSM_PIN_FUNCTION(i2s0_data0),
 	MSM_PIN_FUNCTION(i2s0_data1),
 	MSM_PIN_FUNCTION(i2s0_sck),
@@ -1575,9 +1593,9 @@ static const struct msm_pingroup halliday_groups[] = {
 	[32] = PINGROUP(32, cci_timer, _, phase_flag, _, _, _, _, _, _),
 	[33] = PINGROUP(33, cci_timer, _, phase_flag, _, _, _, _, _, _),
 	[34] = PINGROUP(34, cci_timer, _, phase_flag, _, _, _, _, _, _),
-	[35] = PINGROUP(35, cci_timer, _, _, phase_flag, _, _, _, _, _),
-	[36] = PINGROUP(36, cci_timer, _, _, phase_flag, _, _, _, _, _),
-	[37] = PINGROUP(37, cci_timer, _, _, phase_flag, _, _, _, _, _),
+	[35] = PINGROUP(35, cci_timer, gp_pdm_mira, _, phase_flag, _, _, _, _, _),
+	[36] = PINGROUP(36, cci_timer, gp_pdm_mira, _, phase_flag, _, _, _, _, _),
+	[37] = PINGROUP(37, cci_timer, gp_pdm_mira, _, phase_flag, _, _, _, _, _),
 	[38] = PINGROUP(38, cci_timer, _, phase_flag, _, _, _, _, _, _),
 	[39] = PINGROUP(39, cci_timer, _, phase_flag, _, _, _, _, _, _),
 	[40] = PINGROUP(40, cci_async_in, _, phase_flag, _, _, _, _, _, _),
@@ -1603,7 +1621,7 @@ static const struct msm_pingroup halliday_groups[] = {
 	[60] = PINGROUP(60, qup1_se0_l3_mira, pwm_2, mdp1_vsync0_out, _, _, _, _, _, _),
 	[61] = PINGROUP(61, pwm_3, mdp1_vsync1_out, _, _, _, _, _, _, _),
 	[62] = PINGROUP(62, gcc_gp4, qup1_se0_l3_mirb, mdp1_vsync2_out, _, _, _, _, _, _),
-	[63] = PINGROUP(63, qup1_se1, ibi_i3c, mdp1_vsync3_out, _, _, _, _, _, _),
+	[63] = PINGROUP(63, qup1_se1, ibi_i3c, mdp1_vsync3_out, gp_mn, _, _, _, _, _),
 	[64] = PINGROUP(64, qup1_se1, ibi_i3c, mdp1_vsync4_out, _, _, _, _, _, _),
 	[65] = PINGROUP(65, qup1_se1, mdp1_vsync5_out, _, _, _, _, _, _, _),
 	[66] = PINGROUP(66, qup1_se1_l3_mira, pwm_4, mdp1_vsync6_out, _, _, _, _, _, _),
@@ -1628,9 +1646,9 @@ static const struct msm_pingroup halliday_groups[] = {
 	[85] = PINGROUP(85, qup1_se4, _, _, _, _, _, _, _, _),
 	[86] = PINGROUP(86, qup1_se4, _, _, _, _, _, _, _, _),
 	[87] = PINGROUP(87, gcc_gp8, qup1_se4, _, _, _, _, _, _, _),
-	[88] = PINGROUP(88, qup1_se5, _, _, _, _, _, _, _, _),
-	[89] = PINGROUP(89, qup1_se5, _, _, _, _, _, _, _, _),
-	[90] = PINGROUP(90, qup1_se5, _, _, _, _, _, _, _, _),
+	[88] = PINGROUP(88, qup1_se5, gp_pdm_mirb, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, qup1_se5, gp_pdm_mirb, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, qup1_se5, gp_pdm_mirb, _, _, _, _, _, _, _),
 	[91] = PINGROUP(91, qup1_se5, _, _, _, _, _, _, _, _),
 	[92] = PINGROUP(92, qup1_se6_l0_mira, _, _, _, _, _, _, _, _),
 	[93] = PINGROUP(93, qup1_se6_l1_mira, _, _, _, _, _, _, _, _),

-- 
2.55.0

