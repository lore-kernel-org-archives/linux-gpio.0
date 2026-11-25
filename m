Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589407;
	b=O2xVt3JoNjqBH/Ebv5ATBUd9zkBblNq1r29iXdMsKgiJNIQlKXD1Aw2+mdxOL5/5g/6w
	 OaUqoUuvlFVFujkCk+QasosTVhPH/WPjHXV8KHwX9LGKtgM1F8uW0qbYOFjsVd9e5fyoi
	 AMsU0mH7qlM6x/bRZbKV3NAIRz1qwRyjbAnLp1JIjBQthhO9Voexf7FsavrSyrkZpa9/g
	 kp9I4lcRGEp+vJEvorP9/iG8ah47jZ2WqrV+EiwM1Epi0k57/yeqj2pf1kRyQXdTxI24Y
	 9h8tOUNs7hH1aBKktUjHxIQ6DoB0AUxxCXIfyLnFqS3XSrL4h/SFELWGfy2uHQ9pgbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589407;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=JOWf/QAkHnQIY6Ydltv7SIE5sq0XLeGhITdwlQBXN/E=;
	b=lXDe24do7A5GfFLtzXMVxfOHomAo+x3RkNNM79E+LRiVxB1hSDggy4hMQvD9bqLFdVvH
	 VneB5Koccmz6OVP69z5LgAfmXYqxZh2hSHQCWvOAGiA6j/4ymQpIOTqrMuDFr8a+Z0NDL
	 2e66GhbshFnfjtOdUPymPzr6dleQrwtj74a2h4X6NEFjqNR+0LWnfIpsYnfSjuHOT3dgl
	 5NNGmtGtyk6m2eKqAO8LzVVrAKQVCLuBqpWE0Sp5pTPB+0b6z7T6u9eOBkBrSFsETgYwR
	 gb/EDnBhAc3YGg11gNcZ4wXZ1aGTeb0PBbF+2urJFait7Im3JWjljY245gIec2xQEsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iUm8C0us;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eQdnhOES;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C084606A682;
	Wed, 25 Nov 2026 06:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C084606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iUm8C0us;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eQdnhOES
ARC-Seal: i=1; a=rsa-sha256; t=1795589391; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TjGOncoWIrOAxH1axYIXXJrILjP1S1t0qWnboAPLvrnG8Q2XNwdIPdm+2fBpElZgcQ
    ZVQTwIjndgUw+Sxf67aX7slM0KSsT4hbjARwuIc5suHM9RZvlcK3i5drYIldD0LtdbfO
    a1OwemPnUnSFCHYRsmOqjWNHhCU+l8Or0B/a7Se3gVc94fmY3Q2t0Ult0vjimkutuu3V
    949dcjBF5NWXdxL2LN6d76Tiffw4BMLo5qi7wcqeH1SFvdCh6DVkAC3QuFIaIIWnpXZN
    sN4tpjxARh23lZjUsEpdbbDySxoFdLC0WFmnEeg8XLe5MdT4HOU4i3yu0XmxVeBIEI6l
    UPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589391;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JOWf/QAkHnQIY6Ydltv7SIE5sq0XLeGhITdwlQBXN/E=;
    b=h/B5iRiw3EJBV5xlDUw6EW4NrzT9DnYBwX24kAbRZeQXqmt6c/oI9NWQ9p+UvK/xw4
    +FlF/XwKZtp0frAmzqoh2560kOi7W+KkWkX60HVy2p0xljmOZjON/yP0NwL/SuRfFADL
    yPs9sORy/Gz1iT2mr6LcHQM3RrRjh1UTxasYLzYr4bgrcn/S8bi4BZ8reffFAms0naL7
    VbsehTLxk+eV/svaGhyodBRJuTZnzDUJi0RVOKD3TPGou3upNxOxLDzquHGTzZKHwSdN
    /smjg30dFTOQpvkkQXCyDQpMlmO0iQdl0O1H+tm+pjxrANMgYR0Cnj8x4YDobYfTn6w0
    uO9g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589391;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JOWf/QAkHnQIY6Ydltv7SIE5sq0XLeGhITdwlQBXN/E=;
    b=iUm8C0usHxn3ldSgMmt8WlLwZL9A4w5NLs14UYghRv/8BgnkmFkfccgUKCmDzCW3yT
    u0bMjupm5dRdwts9tXEwlTuDBmczMhhmFOE2YtLiXBMeNiQqWvPisgz8U/0I5JI5+cpP
    G4eRdyr085HoedkovDyKqbb8A3qJWIip4WsBy8vPp4s6ujrKDrEKfV5LaAlyL3uVgGFv
    AKxQXvg8+gFYW0NZL0JUZjqZVuRbwUmVOOzZfaCWzlpIz1b4TtwY11YlhEGI+kR6c9QQ
    AS03Bia0rcC2scpzGgrCUfToFZ7ZXFO0JRH+2Yvhqi7CPxCyQWsYtTKJzAfQ1SzmqK1U
    gQNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795589391;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JOWf/QAkHnQIY6Ydltv7SIE5sq0XLeGhITdwlQBXN/E=;
    b=eQdnhOESfLCC8p8fGBZnGyGbR11kiKj8Lu5FucBDFDja2nmKP/sGKei2Gl0mUgHfKA
    OEZsijjpWvJWBwdTvBAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS25oMlMiNMn5e/Npe6SVDIvzG+5uG4p/zkDZq"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AP6nn5pz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 07:49:49 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v5 5/7] pinctrl: ingenic: Add X2600 pin groups and functions
Date: Wed, 25 Nov 2026 07:49:41 +0100
Message-ID: <7437661c336088f025a2974f1185a5cc3dab2679.1795589383.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795589383.git.hns@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Add X2600 pin groups, mux functions and GPIO configuration.

Use the documented GPIO pin ranges for pull capability masks:
PA0-11, PB0-31, PC0-30, PD0-16 and PE0-20. Add the PCM, PWM,
PWM trigger and WAIT function mappings and remove the empty LCD group.

Define separate UART1 hardware flow-control groups for ports B and C,
which use different pinmux function values.

Apply the UART mux corrections and SLCD pin correction suggested
during review by Hunter Laux.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes V5:
    - add Reviewed-by from Paul Cercueil

 drivers/pinctrl/pinctrl-ingenic.c | 520 ++++++++++++++++++++++++++++++
 1 file changed, 520 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 2d494227d9dbb..88531d472cd2e 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3520,6 +3520,521 @@ static const struct ingenic_chip_info x2100_chip_info = {
 	.access_table = &x2000_access_table,
 };
 
+static const u32 x2600_pull_ups[5] = {
+	0x00000fff, 0xffffffff, 0x7fffffff, 0x0001ffff, 0x001fffff,
+};
+
+static const u32 x2600_pull_downs[5] = {
+	0x00000fff, 0xffffffff, 0x7fffffff, 0x0001ffff, 0x001fffff,
+};
+
+static int x2600_can0_pins[] = { 0x47, 0x48, };
+static int x2600_can1_pins[] = { 0x49, 0x4a, };
+
+static int x2600_cim_pins[] = {
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+	0x08, 0x09, 0x0a, 0x0b,
+};
+
+static int x2600_clk_pins[] = { 0x82, };
+
+static int x2600_dmic_pins[] = { 0x44, 0x45, 0x46, };
+
+static int x2600_i2c0_c_pins[] = { 0x40, 0x41, };
+static int x2600_i2c0_d_pins[] = { 0x64, 0x63, };
+
+static int x2600_i2c1_b_pins[] = { 0x20, 0x21, };
+static int x2600_i2c1_c_pins[] = { 0x42, 0x43, };
+
+static int x2600_i2c2_b_pins[] = { 0x23, 0x22, };
+static int x2600_i2c2_c_pins[] = { 0x53, 0x54, };
+static int x2600_i2c3_c_pins[] = { 0x55, 0x56, };
+static int x2600_i2c3_e_pins[] = { 0x85, 0x86, };
+
+static int x2600_i2s_clk_rx_pins[]  = { 0x4f, }; /* PC15 */
+static int x2600_i2s_sysclk_pins[]  = { 0x50, }; /* PC16 */
+static int x2600_i2s_clk_tx_pins[]  = { 0x51, }; /* PC17 */
+static int x2600_i2s_data_pins[] = { 0x52, 0x53, }; /* PC18, PC19 */
+
+static int x2600_lcd_16bit_pins[] = {
+	0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b,
+	0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x32, 0x33,
+};
+
+static int x2600_lcd_18bit_pins[] = { 0x34, 0x35, };
+
+static int x2600_lcd_24bit_pins[] = {
+	0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b,
+};
+
+static int x2600_lcd_sync_pins[] = { 0x3c, 0x3d, 0x3e, 0x3f, };
+
+static int x2600_mac_pins[] = {
+	0x4f, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
+};
+
+static int x2600_msc0_1bit_pins[] = { 0x60, 0x61, 0x62, };
+static int x2600_msc0_4bit_pins[] = { 0x63, 0x64, 0x65, };
+static int x2600_msc0_8bit_pins[] = { 0x81, 0x82, 0x83, 0x84, };
+
+static int x2600_msc1_1bit_c_pins[] = { 0x59, 0x5a, 0x5b, };
+static int x2600_msc1_4bit_c_pins[] = { 0x5c, 0x5d, 0x5e, };
+
+static int x2600_msc1_1bit_d_pins[] = { 0x66, 0x67, 0x68, };
+static int x2600_msc1_4bit_d_pins[] = { 0x69, 0x6a, 0x6b, };
+
+static int x2600_otg_pins[] = { 0x81, };
+
+static int x2600_pcm_pins[] = { 0x40, 0x41, 0x42, 0x43, }; /* PC0-PC3 (Func3) */
+
+static int x2600_pwm0_pins[] = { 0x2c, }; /* PB12 (Func2) */
+static int x2600_pwm1_pins[] = { 0x2d, }; /* PB13 (Func2) */
+static int x2600_pwm2_pins[] = { 0x2e, }; /* PB14 (Func2) */
+static int x2600_pwm3_pins[] = { 0x2f, }; /* PB15 (Func2) */
+static int x2600_pwm4_pins[] = { 0x30, }; /* PB16 (Func2) */
+static int x2600_pwm5_pins[] = { 0x31, }; /* PB17 (Func2) */
+static int x2600_pwm6_pins[] = { 0x32, }; /* PB18 (Func2) */
+static int x2600_pwm7_pins[] = { 0x33, }; /* PB19 (Func2) */
+static int x2600_pwm8_pins[] = { 0x47, };  /* PC07 (Func0) */
+static int x2600_pwm9_pins[] = { 0x48, };  /* PC08 (Func0) */
+static int x2600_pwm10_c_pins[] = { 0x49, }; /* PC09 (Func0) */
+static int x2600_pwm10_e_pins[] = { 0x82, }; /* PE02 (Func2) */
+static int x2600_pwm11_pins[] = { 0x4a, }; /* PC10 (Func0) */
+static int x2600_pwm12_pins[] = { 0x4b, }; /* PC11 (Func0) */
+static int x2600_pwm13_pins[] = { 0x4c, }; /* PC12 (Func0) */
+static int x2600_pwm14_pins[] = { 0x4d, }; /* PC13 (Func0) */
+static int x2600_pwm15_pins[] = { 0x4e, }; /* PC14 (Func0) */
+static int x2600_pwm_trig_c_pins[] = { 0x54, }; /* PC20 (Func1) */
+static int x2600_pwm_trig_d_pins[] = { 0x6c, }; /* PD12 (Func1) */
+
+static int x2600_sfc_d0_pins[] = { 0x60, 0x61, 0x62, 0x63, 0x64, 0x65, };
+static int x2600_sfc_d6_pins[] = { 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, };
+
+static int x2600_slcd_8bit_pins[] = {
+	0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b,
+};
+
+static int x2600_slcd_16bit_pins[] = {
+	0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x32, 0x33,
+};
+
+static int x2600_slcd_ctrl_pins[] = {
+	0x3c, 0x3d, 0x3e, 0x3f,
+};
+
+static int x2600_ssi0_dt_b_pins[] = { 0x22, };
+static int x2600_ssi0_dr_b_pins[] = { 0x21, };
+static int x2600_ssi0_clk_b_pins[] = { 0x23, };
+static int x2600_ssi0_ce0_b_pins[] = { 0x20, };
+
+static int x2600_ssi0_dt_d_pins[] = { 0x61, };
+static int x2600_ssi0_dr_d_pins[] = { 0x62, };
+static int x2600_ssi0_clk_d_pins[] = { 0x60, };
+static int x2600_ssi0_ce0_d_pins[] = { 0x65, };
+
+static int x2600_ssi1_dt_c15_pins[] = { 0x50, };
+static int x2600_ssi1_dr_c15_pins[] = { 0x51, };
+static int x2600_ssi1_clk_c15_pins[] = { 0x4f, };
+static int x2600_ssi1_ce0_c15_pins[] = { 0x52, };
+
+static int x2600_ssi1_dt_c25_pins[] = { 0x5a, };
+static int x2600_ssi1_dr_c25_pins[] = { 0x5b, };
+static int x2600_ssi1_clk_c25_pins[] = { 0x59, };
+static int x2600_ssi1_ce0_c25_pins[] = { 0x5e, };
+
+static int x2600_ssi_slv_dt_pins[] = { 0x3d, }; /* PB29 (Func2) */
+static int x2600_ssi_slv_dr_pins[] = { 0x3e, }; /* PB30 (Func2) */
+static int x2600_ssi_slv_clk_pins[] = { 0x3c, }; /* PB28 (Func2) */
+static int x2600_ssi_slv_ce0_pins[] = { 0x3f, }; /* PB31 (Func2) */
+
+static int x2600_tcu0_in0_pins[] = { 0x34, }; /* PB20 (Func2) */
+static int x2600_tcu0_in1_pins[] = { 0x35, }; /* PB21 (Func2) */
+static int x2600_tcu1_in0_pins[] = { 0x36, }; /* PB22 (Func2) */
+static int x2600_tcu1_in1_pins[] = { 0x37, }; /* PB23 (Func2) */
+static int x2600_tcu2_in0_pins[] = { 0x38, }; /* PB24 (Func2) */
+static int x2600_tcu2_in1_pins[] = { 0x39, }; /* PB25 (Func2) */
+static int x2600_tcu3_in0_pins[] = { 0x3a, }; /* PB26 (Func2) */
+static int x2600_tcu3_in1_pins[] = { 0x3b, }; /* PB27 (Func2) */
+
+static int x2600_tcu4_in0_pins[] = { 0x47, }; /* PC07 (Func1) */
+static int x2600_tcu4_in1_pins[] = { 0x48, }; /* PC08 (Func1) */
+static int x2600_tcu5_in0_pins[] = { 0x49, }; /* PC09 (Func1) */
+static int x2600_tcu5_in1_pins[] = { 0x4a, }; /* PC10 (Func1) */
+static int x2600_tcu6_in0_pins[] = { 0x4b, }; /* PC11 (Func1) */
+static int x2600_tcu6_in1_pins[] = { 0x4c, }; /* PC12 (Func1) */
+static int x2600_tcu7_in0_pins[] = { 0x4d, }; /* PC13 (Func1) */
+static int x2600_tcu7_in1_pins[] = { 0x4e, }; /* PC14 (Func1) */
+
+static int x2600_uart0_data_c_pins[] = { 0x57, 0x58, };
+static int x2600_uart0_hwflow_c_pins[] = { 0x55, 0x56, };
+static int x2600_uart0_data_e_pins[] = { 0x89, 0x8a, };
+static int x2600_uart0_hwflow_e_pins[] = { 0x8b, 0x8c, };
+
+static int x2600_uart1_data_b_pins[] = { 0x20, 0x21, };
+static int x2600_uart1_data_c_pins[] = { 0x42, 0x43, };
+static int x2600_uart1_hwflow_b_pins[] = { 0x22, 0x23, };
+static int x2600_uart1_hwflow_c_pins[] = { 0x44, 0x45, };
+
+static int x2600_uart2_data_pins[] = { 0x6d, 0x6c, };
+
+static int x2600_uart3_data_b_pins[] = { 0x37, 0x36, };
+static int x2600_uart3_data_c_pins[] = { 0x50, 0x4f, };
+
+static int x2600_uart4_data_b_pins[] = { 0x38, 0x39, };
+static int x2600_uart4_data_c_pins[] = { 0x51, 0x52, };
+static int x2600_uart5_data_b_pins[] = { 0x3a, 0x3b, };
+static int x2600_uart5_data_c_pins[] = { 0x47, 0x48, };
+static int x2600_uart6_data_c_pins[] = { 0x40, 0x41, };
+static int x2600_uart7_data_c_pins[] = { 0x44, 0x45, };
+static int x2600_uart7_data_e_pins[] = { 0x83, 0x84, };
+
+static int x2600_wait_pins[] = { 0x6b, };
+
+static const struct group_desc x2600_groups[] = {
+	/* CAN (Controller Area Network) */
+	INGENIC_PIN_GROUP("can0-data", x2600_can0, 2),
+	INGENIC_PIN_GROUP("can1-data", x2600_can1, 2),
+
+	/* CIM (Camera) */
+	INGENIC_PIN_GROUP("cim-data", x2600_cim, 0),
+
+	/* EXCLK (externel clock output) */
+	INGENIC_PIN_GROUP("ex-clk", x2600_clk, 1),
+
+	/* DMIC */
+	INGENIC_PIN_GROUP("dmic-data", x2600_dmic, 0),
+
+	/* I2Cs */
+	INGENIC_PIN_GROUP("i2c0-data-c", x2600_i2c0_c, 1),
+	INGENIC_PIN_GROUP("i2c0-data-d", x2600_i2c0_d, 2),
+	INGENIC_PIN_GROUP("i2c1-data-b", x2600_i2c1_b, 3),
+	INGENIC_PIN_GROUP("i2c1-data-c", x2600_i2c1_c, 1),
+	INGENIC_PIN_GROUP("i2c2-data-b", x2600_i2c2_b, 3),
+	INGENIC_PIN_GROUP("i2c2-data-c", x2600_i2c2_c, 2),
+	INGENIC_PIN_GROUP("i2c3-data-c", x2600_i2c3_c, 2),
+	INGENIC_PIN_GROUP("i2c3-data-e", x2600_i2c3_e, 1),
+
+	/* I2S (Audio) & PCM */
+	INGENIC_PIN_GROUP("i2s-clk-rx", x2600_i2s_clk_rx, 1),
+	INGENIC_PIN_GROUP("i2s-sysclk", x2600_i2s_sysclk, 1),
+	INGENIC_PIN_GROUP("i2s-clk-tx", x2600_i2s_clk_tx, 1),
+	INGENIC_PIN_GROUP("i2s-data", x2600_i2s_data, 1),
+	INGENIC_PIN_GROUP("pcm", x2600_pcm, 3),
+
+	/* LCD & SLCD */
+	INGENIC_PIN_GROUP("lcd-16bit", x2600_lcd_16bit, 0),
+	INGENIC_PIN_GROUP("lcd-18bit", x2600_lcd_18bit, 0),
+	INGENIC_PIN_GROUP("lcd-24bit", x2600_lcd_24bit, 0),
+	INGENIC_PIN_GROUP("lcd-sync", x2600_lcd_sync, 0),
+	INGENIC_PIN_GROUP("slcd-8bit", x2600_slcd_8bit, 1),
+	INGENIC_PIN_GROUP("slcd-16bit", x2600_slcd_16bit, 1),
+	INGENIC_PIN_GROUP("slcd-ctrl", x2600_slcd_ctrl, 1),
+
+	/* MAC (Ethernet) */
+	INGENIC_PIN_GROUP("mac", x2600_mac, 0),
+
+	/* MMCs (MSC) */
+	INGENIC_PIN_GROUP("mmc0-1bit", x2600_msc0_1bit, 0),
+	INGENIC_PIN_GROUP("mmc0-4bit", x2600_msc0_4bit, 0),
+	INGENIC_PIN_GROUP("mmc0-8bit", x2600_msc0_8bit, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit-c", x2600_msc1_1bit_c, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit-c", x2600_msc1_4bit_c, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit-d", x2600_msc1_1bit_d, 1),
+	INGENIC_PIN_GROUP("mmc1-4bit-d", x2600_msc1_4bit_d, 1),
+
+	/* OTG (Vbus driver) */
+	INGENIC_PIN_GROUP("otg-vbus", x2600_otg, 1),
+
+	/* PWMs */
+	INGENIC_PIN_GROUP("pwm0", x2600_pwm0, 2),
+	INGENIC_PIN_GROUP("pwm1", x2600_pwm1, 2),
+	INGENIC_PIN_GROUP("pwm2", x2600_pwm2, 2),
+	INGENIC_PIN_GROUP("pwm3", x2600_pwm3, 2),
+	INGENIC_PIN_GROUP("pwm4", x2600_pwm4, 2),
+	INGENIC_PIN_GROUP("pwm5", x2600_pwm5, 2),
+	INGENIC_PIN_GROUP("pwm6", x2600_pwm6, 2),
+	INGENIC_PIN_GROUP("pwm7", x2600_pwm7, 2),
+	INGENIC_PIN_GROUP("pwm8", x2600_pwm8, 0),
+	INGENIC_PIN_GROUP("pwm9", x2600_pwm9, 0),
+	INGENIC_PIN_GROUP("pwm10-c", x2600_pwm10_c, 0),
+	INGENIC_PIN_GROUP("pwm10-e", x2600_pwm10_e, 2),
+	INGENIC_PIN_GROUP("pwm11", x2600_pwm11, 0),
+	INGENIC_PIN_GROUP("pwm12", x2600_pwm12, 0),
+	INGENIC_PIN_GROUP("pwm13", x2600_pwm13, 0),
+	INGENIC_PIN_GROUP("pwm14", x2600_pwm14, 0),
+	INGENIC_PIN_GROUP("pwm15", x2600_pwm15, 0),
+	INGENIC_PIN_GROUP("pwm-trig-c", x2600_pwm_trig_c, 1),
+	INGENIC_PIN_GROUP("pwm-trig-d", x2600_pwm_trig_d, 1),
+
+	/* SFC (Serial Flash Controller) */
+	INGENIC_PIN_GROUP("sfc-d0", x2600_sfc_d0, 1),
+	INGENIC_PIN_GROUP("sfc-d6", x2600_sfc_d6, 0),
+
+	/* SSIs (SPI) */
+	INGENIC_PIN_GROUP("ssi0-dt-b", x2600_ssi0_dt_b, 0),
+	INGENIC_PIN_GROUP("ssi0-dr-b", x2600_ssi0_dr_b, 0),
+	INGENIC_PIN_GROUP("ssi0-clk-b", x2600_ssi0_clk_b, 0),
+	INGENIC_PIN_GROUP("ssi0-ce0-b", x2600_ssi0_ce0_b, 0),
+	INGENIC_PIN_GROUP("ssi0-dt-d", x2600_ssi0_dt_d, 2),
+	INGENIC_PIN_GROUP("ssi0-dr-d", x2600_ssi0_dr_d, 2),
+	INGENIC_PIN_GROUP("ssi0-clk-d", x2600_ssi0_clk_d, 2),
+	INGENIC_PIN_GROUP("ssi0-ce0-d", x2600_ssi0_ce0_d, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-c15", x2600_ssi1_dt_c15, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-c15", x2600_ssi1_dr_c15, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-c15", x2600_ssi1_clk_c15, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-c15", x2600_ssi1_ce0_c15, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-c25", x2600_ssi1_dt_c25, 1),
+	INGENIC_PIN_GROUP("ssi1-dr-c25", x2600_ssi1_dr_c25, 1),
+	INGENIC_PIN_GROUP("ssi1-clk-c25", x2600_ssi1_clk_c25, 1),
+	INGENIC_PIN_GROUP("ssi1-ce0-c25", x2600_ssi1_ce0_c25, 1),
+	INGENIC_PIN_GROUP("ssi-slv-dt-b", x2600_ssi_slv_dt, 2),
+	INGENIC_PIN_GROUP("ssi-slv-dr-b", x2600_ssi_slv_dr, 2),
+	INGENIC_PIN_GROUP("ssi-slv-clk-b", x2600_ssi_slv_clk, 2),
+	INGENIC_PIN_GROUP("ssi-slv-ce0-b", x2600_ssi_slv_ce0, 2),
+
+	/* TCUs (Timer & Counter Units) */
+	INGENIC_PIN_GROUP("tcu0_in0", x2600_tcu0_in0, 2),
+	INGENIC_PIN_GROUP("tcu0_in1", x2600_tcu0_in1, 2),
+	INGENIC_PIN_GROUP("tcu1_in0", x2600_tcu1_in0, 2),
+	INGENIC_PIN_GROUP("tcu1_in1", x2600_tcu1_in1, 2),
+	INGENIC_PIN_GROUP("tcu2_in0", x2600_tcu2_in0, 2),
+	INGENIC_PIN_GROUP("tcu2_in1", x2600_tcu2_in1, 2),
+	INGENIC_PIN_GROUP("tcu3_in0", x2600_tcu3_in0, 2),
+	INGENIC_PIN_GROUP("tcu3_in1", x2600_tcu3_in1, 2),
+	INGENIC_PIN_GROUP("tcu4_in0", x2600_tcu4_in0, 1),
+	INGENIC_PIN_GROUP("tcu4_in1", x2600_tcu4_in1, 1),
+	INGENIC_PIN_GROUP("tcu5_in0", x2600_tcu5_in0, 1),
+	INGENIC_PIN_GROUP("tcu5_in1", x2600_tcu5_in1, 1),
+	INGENIC_PIN_GROUP("tcu6_in0", x2600_tcu6_in0, 1),
+	INGENIC_PIN_GROUP("tcu6_in1", x2600_tcu6_in1, 1),
+	INGENIC_PIN_GROUP("tcu7_in0", x2600_tcu7_in0, 1),
+	INGENIC_PIN_GROUP("tcu7_in1", x2600_tcu7_in1, 1),
+
+	/* UARTs */
+	INGENIC_PIN_GROUP("uart0-data-c", x2600_uart0_data_c, 1),
+	INGENIC_PIN_GROUP("uart0-hwflow-c", x2600_uart0_hwflow_c, 1),
+	INGENIC_PIN_GROUP("uart0-data-e", x2600_uart0_data_e, 1),
+	INGENIC_PIN_GROUP("uart0-hwflow-e", x2600_uart0_hwflow_e, 1),
+	INGENIC_PIN_GROUP("uart1-data-b", x2600_uart1_data_b, 1),
+	INGENIC_PIN_GROUP("uart1-data-c", x2600_uart1_data_c, 2),
+	INGENIC_PIN_GROUP("uart1-hwflow-b", x2600_uart1_hwflow_b, 1),
+	INGENIC_PIN_GROUP("uart1-hwflow-c", x2600_uart1_hwflow_c, 2),
+	INGENIC_PIN_GROUP("uart2-data", x2600_uart2_data, 0),
+	INGENIC_PIN_GROUP("uart3-data-b", x2600_uart3_data_b, 1),
+	INGENIC_PIN_GROUP("uart3-data-c", x2600_uart3_data_c, 3),
+	INGENIC_PIN_GROUP("uart4-data-b", x2600_uart4_data_b, 1),
+	INGENIC_PIN_GROUP("uart4-data-c", x2600_uart4_data_c, 3),
+	INGENIC_PIN_GROUP("uart5-data-b", x2600_uart5_data_b, 1),
+	INGENIC_PIN_GROUP("uart5-data-c", x2600_uart5_data_c, 3),
+	INGENIC_PIN_GROUP("uart6-data-c", x2600_uart6_data_c, 2),
+	INGENIC_PIN_GROUP("uart7-data-c", x2600_uart7_data_c, 1),
+	INGENIC_PIN_GROUP("uart7-data-e", x2600_uart7_data_e, 1),
+
+	/* WAIT */
+	INGENIC_PIN_GROUP("wait", x2600_wait, 3),
+};
+
+static const char * const x2600_can0_groups[] = { "can0-data", };
+static const char * const x2600_can1_groups[] = { "can1-data", };
+
+static const char * const x2600_cim_groups[] = { "cim-data", };
+
+static const char * const x2600_clk_groups[] = { "ex-clk", };
+
+static const char * const x2600_dmic_groups[] = { "dmic-data", };
+
+static const char * const x2600_lcd_groups[] = {
+	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-sync",
+};
+
+static const char * const x2600_i2c0_groups[] = { "i2c0-data-c", "i2c0-data-d", };
+static const char * const x2600_i2c1_groups[] = { "i2c1-data-b", "i2c1-data-c", };
+static const char * const x2600_i2c2_groups[] = { "i2c2-data-b", "i2c2-data-c", };
+static const char * const x2600_i2c3_groups[] = { "i2c3-data-c", "i2c3-data-e", };
+
+static const char * const x2600_i2s_groups[] = {
+	"i2s-data", "i2s-clk-rx", "i2s-clk-tx", "i2s-sysclk",
+};
+
+static const char * const x2600_pcm_groups[] = { "pcm", };
+
+static const char * const x2600_mac_groups[] = { "mac", };
+
+static const char * const x2600_msc0_groups[] = { "mmc0-1bit", "mmc0-4bit", "mmc0-8bit", };
+
+static const char * const x2600_msc1_groups[] = {
+	"mmc1-1bit-c", "mmc1-4bit-c", "mmc1-1bit-d", "mmc1-4bit-d",
+};
+
+static const char * const x2600_otg_groups[] = { "otg-vbus", };
+
+static const char * const x2600_pwm0_groups[] = { "pwm0", };
+static const char * const x2600_pwm1_groups[] = { "pwm1", };
+static const char * const x2600_pwm2_groups[] = { "pwm2", };
+static const char * const x2600_pwm3_groups[] = { "pwm3", };
+static const char * const x2600_pwm4_groups[] = { "pwm4", };
+static const char * const x2600_pwm5_groups[] = { "pwm5", };
+static const char * const x2600_pwm6_groups[] = { "pwm6", };
+static const char * const x2600_pwm7_groups[] = { "pwm7", };
+static const char * const x2600_pwm8_groups[] = { "pwm8", };
+static const char * const x2600_pwm9_groups[] = { "pwm9", };
+static const char * const x2600_pwm10_groups[] = { "pwm10-c", "pwm10-e", };
+
+static const char * const x2600_pwm11_groups[] = { "pwm11", };
+static const char * const x2600_pwm12_groups[] = { "pwm12", };
+static const char * const x2600_pwm13_groups[] = { "pwm13", };
+static const char * const x2600_pwm14_groups[] = { "pwm14", };
+static const char * const x2600_pwm15_groups[] = { "pwm15", };
+static const char * const x2600_pwm_trig_groups[] = { "pwm-trig-c", "pwm-trig-d", };
+static const char * const x2600_wait_groups[] = { "wait", };
+
+static const char * const x2600_sfc_groups[] = { "sfc-d0", "sfc-d6", };
+
+static const char * const x2600_slcd_groups[] = { "slcd-8bit", "slcd-16bit", "slcd-ctrl", };
+
+static const char * const x2600_ssi0_groups[] = {
+	"ssi0-dt-b", "ssi0-dr-b", "ssi0-clk-b", "ssi0-ce0-b",
+	"ssi0-dt-d", "ssi0-dr-d", "ssi0-clk-d", "ssi0-ce0-d",
+};
+
+static const char * const x2600_ssi1_groups[] = {
+	"ssi1-dt-c15", "ssi1-dr-c15", "ssi1-clk-c15", "ssi1-ce0-c15",
+	"ssi1-dt-c25", "ssi1-dr-c25", "ssi1-clk-c25", "ssi1-ce0-c25",
+};
+
+static const char * const x2600_ssi_slv_groups[] = {
+	"ssi-slv-dt-b", "ssi-slv-dr-b", "ssi-slv-clk-b", "ssi-slv-ce0-b",
+};
+
+static const char * const x2600_tcu_groups[] = {
+	"tcu0_in0", "tcu0_in1",
+	"tcu1_in0", "tcu1_in1",
+	"tcu2_in0", "tcu2_in1",
+	"tcu3_in0", "tcu3_in1",
+	"tcu4_in0", "tcu4_in1",
+	"tcu5_in0", "tcu5_in1",
+	"tcu6_in0", "tcu6_in1",
+	"tcu7_in0", "tcu7_in1",
+};
+
+static const char * const x2600_uart0_groups[] = {
+	"uart0-data-c", "uart0-hwflow-c", "uart0-data-e", "uart0-hwflow-e",
+};
+
+static const char * const x2600_uart1_groups[] = {
+	"uart1-data-b", "uart1-data-c",
+	"uart1-hwflow-b", "uart1-hwflow-c",
+};
+
+static const char * const x2600_uart2_groups[] = { "uart2-data", };
+static const char * const x2600_uart3_groups[] = { "uart3-data-b", "uart3-data-c", };
+static const char * const x2600_uart4_groups[] = { "uart4-data-b", "uart4-data-c", };
+static const char * const x2600_uart5_groups[] = { "uart5-data-b", "uart5-data-c", };
+static const char * const x2600_uart6_groups[] = { "uart6-data-c", };
+static const char * const x2600_uart7_groups[] = { "uart7-data-c", "uart7-data-e", };
+
+static const struct pinfunction x2600_functions[] = {
+	INGENIC_PIN_FUNCTION("can0", x2600_can0),
+	INGENIC_PIN_FUNCTION("can1", x2600_can1),
+	INGENIC_PIN_FUNCTION("cim", x2600_cim),
+	INGENIC_PIN_FUNCTION("exclk", x2600_clk),
+	INGENIC_PIN_FUNCTION("dmic", x2600_dmic),
+	INGENIC_PIN_FUNCTION("i2c0", x2600_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", x2600_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", x2600_i2c2),
+	INGENIC_PIN_FUNCTION("i2c3", x2600_i2c3),
+	INGENIC_PIN_FUNCTION("i2s", x2600_i2s),
+	INGENIC_PIN_FUNCTION("pcm", x2600_pcm),
+	INGENIC_PIN_FUNCTION("lcd", x2600_lcd),
+	INGENIC_PIN_FUNCTION("mac", x2600_mac),
+	INGENIC_PIN_FUNCTION("mmc0", x2600_msc0),
+	INGENIC_PIN_FUNCTION("mmc1", x2600_msc1),
+	INGENIC_PIN_FUNCTION("otg", x2600_otg),
+	INGENIC_PIN_FUNCTION("pwm0", x2600_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", x2600_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", x2600_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", x2600_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", x2600_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", x2600_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", x2600_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", x2600_pwm7),
+	INGENIC_PIN_FUNCTION("pwm8", x2600_pwm8),
+	INGENIC_PIN_FUNCTION("pwm9", x2600_pwm9),
+	INGENIC_PIN_FUNCTION("pwm10", x2600_pwm10),
+	INGENIC_PIN_FUNCTION("pwm11", x2600_pwm11),
+	INGENIC_PIN_FUNCTION("pwm12", x2600_pwm12),
+	INGENIC_PIN_FUNCTION("pwm13", x2600_pwm13),
+	INGENIC_PIN_FUNCTION("pwm14", x2600_pwm14),
+	INGENIC_PIN_FUNCTION("pwm15", x2600_pwm15),
+	INGENIC_PIN_FUNCTION("pwm-trig", x2600_pwm_trig),
+	INGENIC_PIN_FUNCTION("sfc", x2600_sfc),
+	INGENIC_PIN_FUNCTION("slcd", x2600_slcd),
+	INGENIC_PIN_FUNCTION("ssi0", x2600_ssi0),
+	INGENIC_PIN_FUNCTION("ssi1", x2600_ssi1),
+	INGENIC_PIN_FUNCTION("ssi-slv", x2600_ssi_slv),
+	INGENIC_PIN_FUNCTION("uart0", x2600_uart0),
+	INGENIC_PIN_FUNCTION("uart1", x2600_uart1),
+	INGENIC_PIN_FUNCTION("uart2", x2600_uart2),
+	INGENIC_PIN_FUNCTION("uart3", x2600_uart3),
+	INGENIC_PIN_FUNCTION("uart4", x2600_uart4),
+	INGENIC_PIN_FUNCTION("uart5", x2600_uart5),
+	INGENIC_PIN_FUNCTION("uart6", x2600_uart6),
+	INGENIC_PIN_FUNCTION("uart7", x2600_uart7),
+	INGENIC_PIN_FUNCTION("tcu", x2600_tcu),
+	INGENIC_PIN_FUNCTION("wait", x2600_wait),
+};
+
+static const struct regmap_range x2600_access_ranges[] = {
+	regmap_reg_range(0x0000 + 0x000, 0x0000 + 0x0e8),
+	regmap_reg_range(0x0000 + 0x170, 0x0000 + 0x190),
+	regmap_reg_range(0x0000 + 0x200, 0x0000 + 0x210),
+	regmap_reg_range(0x0000 + 0x814, 0x0000 + 0x8f0),
+	regmap_reg_range(0x0000 + 0x974, 0x0000 + 0x978),
+
+	regmap_reg_range(0x1000 + 0x000, 0x1000 + 0x0e8),
+	regmap_reg_range(0x1000 + 0x170, 0x1000 + 0x190),
+	regmap_reg_range(0x1000 + 0x200, 0x1000 + 0x210),
+	regmap_reg_range(0x1000 + 0x814, 0x1000 + 0x8f0),
+	regmap_reg_range(0x1000 + 0x974, 0x1000 + 0x978),
+
+	regmap_reg_range(0x2000 + 0x000, 0x2000 + 0x0e8),
+	regmap_reg_range(0x2000 + 0x170, 0x2000 + 0x190),
+	regmap_reg_range(0x2000 + 0x200, 0x2000 + 0x210),
+	regmap_reg_range(0x2000 + 0x814, 0x2000 + 0x8f0),
+	regmap_reg_range(0x2000 + 0x974, 0x2000 + 0x978),
+
+	regmap_reg_range(0x3000 + 0x000, 0x3000 + 0x0e8),
+	regmap_reg_range(0x3000 + 0x170, 0x3000 + 0x190),
+	regmap_reg_range(0x3000 + 0x200, 0x3000 + 0x210),
+	regmap_reg_range(0x3000 + 0x814, 0x3000 + 0x8f0),
+	regmap_reg_range(0x3000 + 0x974, 0x3000 + 0x978),
+
+	regmap_reg_range(0x4000 + 0x000, 0x4000 + 0x0e8),
+	regmap_reg_range(0x4000 + 0x100, 0x4000 + 0x118),
+	regmap_reg_range(0x4000 + 0x170, 0x4000 + 0x190),
+	regmap_reg_range(0x4000 + 0x200, 0x4000 + 0x210),
+	regmap_reg_range(0x4000 + 0x814, 0x4000 + 0x8f0),
+	regmap_reg_range(0x4000 + 0x974, 0x4000 + 0x978),
+};
+
+static const struct regmap_access_table x2600_access_table = {
+	.yes_ranges = x2600_access_ranges,
+	.n_yes_ranges = ARRAY_SIZE(x2600_access_ranges),
+};
+
+static const struct ingenic_chip_info x2600_chip_info = {
+	.num_chips = 5,
+	.reg_offset = 0x1000,
+	.version = ID_X2600,
+	.groups = x2600_groups,
+	.num_groups = ARRAY_SIZE(x2600_groups),
+	.functions = x2600_functions,
+	.num_functions = ARRAY_SIZE(x2600_functions),
+	.pull_ups = x2600_pull_ups,
+	.pull_downs = x2600_pull_downs,
+	.access_table = &x2600_access_table,
+};
+
 static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 {
 	unsigned int val;
@@ -4436,6 +4951,7 @@ static const struct of_device_id ingenic_gpio_of_matches[] __initconst = {
 	{ .compatible = "ingenic,x1830-gpio" },
 	{ .compatible = "ingenic,x2000-gpio" },
 	{ .compatible = "ingenic,x2100-gpio" },
+	{ .compatible = "ingenic,x2600-gpio" },
 	{},
 };
 
@@ -4697,6 +5213,10 @@ static const struct of_device_id ingenic_pinctrl_of_matches[] = {
 		.compatible = "ingenic,x2100-pinctrl",
 		.data = IF_ENABLED(CONFIG_MACH_X2100, &x2100_chip_info)
 	},
+	{
+		.compatible = "ingenic,x2600-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X2600, &x2600_chip_info)
+	},
 	{ /* sentinel */ },
 };
 
-- 
2.56.0

