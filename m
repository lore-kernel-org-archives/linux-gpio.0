Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=JZEBt3SmHQUB5bflRcsrJhX1xSxUlFwb2gHOLtoUXoM23ieD1ajxsblPt8BaNdQPU4rR
	 OcGVIUQTRVjoWgGUa7p+aD8qwSxm8EAu/8vBI6HKXDykoxSegfcYa8sD1Tjzjo4I/uT2B
	 WClFmYjFuhilHzr8yijgkHAgesgFAeAnCQAqsET/dZMCMI+eSevW0DQOcuA6KBUEOcWU9
	 3fBmERhOYvnax8NxnJHZlh2JY5mWU1mJoBNRklzmywU2KWDWGANeDq89pOSLRccayHF42
	 Fy9bE0U8a8X9XgkYEUHBt7tE0o6XmLcqb0dr8KZL5lSq5cZ5zEIevbEYLpFhIheXX4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ruOWN/5KczFzi5EmKVXuc5kboKCJ+D0Q6dSIajHNBRk=;
	b=NrbcpFdv3GiExqvoatF8IStcTv7hS+2ruwobxORkyaxllAs1R2s6oWZJ5PIWv6Q/l+8g
	 n+L3drZksOgKHvt+6sUdCbSqfAuzESxv+eSG+P0yh45pw51sniXGHcA0bSeXEiOGKtH7C
	 JwdimmIdgDRVb2vIXr4ZQlD+O/CbCVmX1y6skCwa7OGQMiz1dTh2r+HmACFcKOLfbaw2x
	 xT1KW47PdpHTeiUJVzWRrjVf4Sn51MYV4bsdOX4TShadlVmGcKZukRyTg32RnXkSPhJKQ
	 7lSslki7nOj1qw+C91V9nbnqca8qkAsHPljaaC1NuAXc8hV91ckq814AcRp1HRwUAUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mqT9wkd2;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A83E6077D8D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 18:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A83E6077D8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mqT9wkd2
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so626043f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595140; x=1795199940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruOWN/5KczFzi5EmKVXuc5kboKCJ+D0Q6dSIajHNBRk=;
        b=mqT9wkd2VfmZ459fJFn6zLb5jLt4fRbJLXhdHpp6CDeu0C5fbjdPf3Czm0IXCt0LQ8
         f4kd6yB0mPrzzJ2ldogweunw+Q+hSaaaaTlTm7tQhn/GOh4pKLgPnhjKy0WLB1lysPaS
         onkmjpk4MS7JM8BckU2sXaXGx22VaXSYQY/0Ps8AhIujv/0FwFsSTJfb91i/6BwPXRfb
         70MC/kDN9v72BfVqGSxI4lkZaFJC2LCFcwNSCInb+oOZb3D8DffphUNg6AKxv+N6kCiW
         J2Yc3C+wiCH2kI+tj5FxxMGVrAOeDGVN+58CcVBwDxiERRoVP4BH932011srInnylgbh
         kNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595140; x=1795199940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruOWN/5KczFzi5EmKVXuc5kboKCJ+D0Q6dSIajHNBRk=;
        b=INxGrtIh3kLiX3V40C66KqiH+MMqLEtbCQjW51Up94FKVlltPgZmD6Wa+gHojN6gzX
         H2Coshga7BJZrYnd4FHD+RYbm9mXgzSNiP69qnlp/ErUjut41xddjqXiwfuy/X2ipiy9
         4PDA2q+THqKshCCWbVL0aMudz5RNCUlTrLQJxipaohxqhhBmEfjwdhluL0Dwv4lo9UqA
         AXL1uVKR0X9eCI2ZVcWduRMEcyLNDY+9dKj4XREsmZ86eA18CgmtiL5/88qB8TNNm68g
         De/nt6U7GBMuogkx4ubDKca4qtTHCSWeOjoD9WM/x9D37Pqr1Gp04lia2qRj6zSld3F0
         ZarA==
X-Forwarded-Encrypted: i=1; AL+hErHK2hya7r5HZyJOv4VurufUtTQ8X9l4At7P5NDcOyBnpNUybf3GuIjRpPZZHjAoFOzMoQ+cwSiP/OKd@vger.kernel.org
X-Gm-Message-State: APuU4Z9iGIc+wYgL4JRSEeLtMMV7p2oLxnKooIldw8syj1zaBQeuFD3z
	8fNCNUQ/5UztrmEjilRmnNHGXYBC1httPvtaYbbL/j9sjXSGuppbbMZmarhG/IJgLgU=
X-Gm-Gg: AYBFou23107LFgwMDuilaAR+xddclvki09VAYc+N/dTWmH02S+a2TxoLUOyUHT4jacc
	GkkVGEJud1PADKQM8r6XekZ6rgiSVd4l6HdjtXI1OaIfBRF62s3d6rPtxxnNRXNPwumsN5yivOq
	xJ4TP8MoHUTPLlXwman9jejd43ouTAKKLcRSWi9nYtWoaw1bS5nH8c1EPVrOycTH9r3FeveFVz0
	2YcuA+xzZhkW70AdEsDR2cLu5GBmZIZSXqoItCf4YT1nkWkRNBYqHh6YL7HQBcLJN8+zQJX/Uy2
	WVcw8BG6J6cPLdrultbwSvkXnZDStIHACfi6C+aiDLOiMCqntiqfLadvJGwuDwiNzTQAamqcYx7
	ZCyctK20c3LxUYRcC5pIL/dKPgFr4l1QiaDyJDu440+fWb6WSr1nuG91zZjKASXhvHIgdrzXyhR
	IVp9RbBPOivT/zv9OfRXGLVuMsiUVVOFSIM3KjKUXcmTkitdVRryMz8ohHAez6reNBAz6zhfv/u
	i6LdO+90aC66ieCwTv/LpOme9AiAQtLD+pvJIgXG2LUoSJjzzARvUiagoo6PsC7BSg9aXIHXdv5
	sPbp6OF1ca2ZjAwn+n4LM1xJg+1VqHZYReZQmZZJIGbRD7Grt/HbBOIPq5cj7yqP
X-Received: by 2002:a05:6000:18a3:b0:48d:f3a5:4563 with SMTP id ffacd0b85a97d-49c70ed9360mr8732039f8f.20.1794595139339;
        Fri, 13 Nov 2026 10:38:59 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:34 +0100
Subject: [PATCH RFC 20/23] arm64: dts: qcom: sm8650: move EL1 Gunyah nodes
 to sm8650-el1.dtsi
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
Message-Id: <20261113-topic-sm8650-el2-v1-20-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=45562;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=k4XR5dY2pw9/U5WuHtpbd/F2+hsJblZ2+IOV7rcwedw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kn39mjkrKwDFLoHcb2wdXUR8ea5RU/VB5nti+O
 WRDOgXKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJwAKCRB33NvayMhJ0UsxEA
 CVA6BLTb/SSoNV5Ojd4rK7wq5x+hAiH8tXy9k3uPCHxM3XBL3PZKGAV/xXTq3y+zowYu0Ca7CGRsOn
 zxM22MJ49eKm8CGFQPQoLdiOBd7PDKAcvzvqCUkh/uracuhS8ZLKzOm+qxKRFYqoqDL4C3NDm14sNd
 MJW1GOffuwwsOp6iawsn9s5W6lqM51IT/UnxzBjTcBE5iO+zkeUAkjsB26YLm4cpH/TuFoYAN06uDE
 89oHkrzHaPVrlkO7lHK24TIYIq4OxD46h1BgLAzQypBdzhLcNxDsmmpBHaaDXbJrER9HiR7GXzUmyN
 knfpA/I4lrqePviVY6ZHcV/2ekI8prJ1I3pv/4ZEf6rDPcDd9+sZ6ln4+An35/D7QrlsauHvjrFE3s
 TC5E1HvqfnZsOiEDzkKEZ7cJiOM2tRk4tLyvwEifHUrZpJYWSnA8Ppxg5wojagSPa2rpXuHzMt0Lw0
 1iuvFIsGcN3tTJw3wowBdWTh/HojajCs+FeWbZqEVHGixVBoAPEnpCnFBJCHfl/kPJwwwdX56HBkW8
 9F6u/wRHZDDDY0bTSDwBH6KHA8/IuoDi8ga3cXeJ7ZjiuiddKTtQhuwE2bH89BhfYtGnZT18nMW728
 4bO+fWkgok4r+2BjzL/6gE5mYoIo/LDEwpyBxyfJxxC4Abi/3DIh+35i2Rlg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The reserved memory map, remoteprocs, SMP2P, IPA, GPU zap shader and the
q6prm LPASS clocks only apply when booting at EL1 under Gunyah, and
boards booting Linux at EL2 had to delete them.

Move them into sm8650-el1.dtsi, included by the EL1 boards, and drop the
node deletions from the Deckard dts.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |   1 +
 arch/arm64/boot/dts/qcom/sm8650-el1.dtsi           | 775 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  |  21 -
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 774 +-------------------
 7 files changed, 801 insertions(+), 773 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 48fbf0650f0e..dfcd26bbe42c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8650.dtsi"
+#include "sm8650-el1.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
 #define PMK8550VE_SID 8
diff --git a/arch/arm64/boot/dts/qcom/sm8650-el1.dtsi b/arch/arm64/boot/dts/qcom/sm8650-el1.dtsi
new file mode 100644
index 000000000000..18b7c18ae312
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-el1.dtsi
@@ -0,0 +1,775 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Linaro Limited
+ */
+
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+/ {
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: hyp@80000000 {
+			reg = <0 0x80000000 0 0xe00000>;
+			no-map;
+		};
+
+		cpusys_vm_mem: cpusys-vm@80e00000 {
+			reg = <0 0x80e00000 0 0x400000>;
+			no-map;
+		};
+
+		/* Merged xbl_dtlog, xbl_ramdump and aop_image regions */
+		xbl_dt_log_merged_mem: xbl-dt-log-merged@81a00000 {
+			reg = <0 0x81a00000 0 0x260000>;
+			no-map;
+		};
+
+		aop_cmd_db_mem: aop-cmd-db@81c60000 {
+			compatible = "qcom,cmd-db";
+			reg = <0 0x81c60000 0 0x20000>;
+			no-map;
+		};
+
+		/* Merged aop_config, tme_crash_dump, tme_log, uefi_log, and chipinfo regions */
+		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
+			reg = <0 0x81c80000 0 0x75000>;
+			no-map;
+		};
+
+		/* Secdata region can be reused by apps */
+
+		smem: smem@81d00000 {
+			compatible = "qcom,smem";
+			reg = <0 0x81d00000 0 0x200000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		adsp_mhi_mem: adsp-mhi@81f00000 {
+			reg = <0 0x81f00000 0 0x20000>;
+			no-map;
+		};
+
+		pvmfw_mem: pvmfw@824a0000 {
+			reg = <0 0x824a0000 0 0x100000>;
+			no-map;
+		};
+
+		global_sync_mem: global-sync@82600000 {
+			reg = <0 0x82600000 0 0x100000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@82700000 {
+			reg = <0 0x82700000 0 0x100000>;
+			no-map;
+		};
+
+		qdss_mem: qdss@82800000 {
+			reg = <0 0x82800000 0 0x2000000>;
+			no-map;
+		};
+
+		qlink_logging_mem: qlink-logging@84800000 {
+			reg = <0 0x84800000 0 0x200000>;
+			no-map;
+		};
+
+		mpss_dsm_mem: mpss-dsm@86b00000 {
+			reg = <0 0x86b00000 0 0x4900000>;
+			no-map;
+		};
+
+		mpss_dsm_mem_2: mpss-dsm-2@8b400000 {
+			reg = <0 0x8b400000 0 0x800000>;
+			no-map;
+		};
+
+		mpss_mem: mpss@8bc00000 {
+			reg = <0 0x8bc00000 0 0xf400000>;
+			no-map;
+		};
+
+		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
+			reg = <0 0x9b000000 0 0x80000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@9b080000 {
+			reg = <0 0x9b080000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@9b090000 {
+			reg = <0 0x9b090000 0 0xa000>;
+			no-map;
+		};
+
+		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
+			reg = <0 0x9b09a000 0 0x2000>;
+			no-map;
+		};
+
+		spss_region_mem: spss@9b0a0000 {
+			reg = <0 0x9b0a0000 0 0x1e0000>;
+			no-map;
+		};
+
+		/* First part of the "SPU secure shared memory" region */
+		spu_tz_shared_mem: spu-tz-shared@9b280000 {
+			reg = <0 0x9b280000 0 0x60000>;
+			no-map;
+		};
+
+		/* Second part of the "SPU secure shared memory" region */
+		spu_modem_shared_mem: spu-modem-shared@9b2e0000 {
+			reg = <0 0x9b2e0000 0 0x20000>;
+			no-map;
+		};
+
+		camera_mem: camera@9b300000 {
+			reg = <0 0x9b300000 0 0x800000>;
+			no-map;
+		};
+
+		video_mem: video@9bb00000 {
+			reg = <0 0x9bb00000 0 0x800000>;
+			no-map;
+		};
+
+		cvp_mem: cvp@9c300000 {
+			reg = <0 0x9c300000 0 0x700000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@9ca00000 {
+			reg = <0 0x9ca00000 0 0x1400000>;
+			no-map;
+		};
+
+		q6_cdsp_dtb_mem: q6-cdsp-dtb@9de00000 {
+			reg = <0 0x9de00000 0 0x80000>;
+			no-map;
+		};
+
+		q6_adsp_dtb_mem: q6-adsp-dtb@9de80000 {
+			reg = <0 0x9de80000 0 0x80000>;
+			no-map;
+		};
+
+		adspslpi_mem: adspslpi@9df00000 {
+			reg = <0 0x9df00000 0 0x4080000>;
+			no-map;
+		};
+
+		rmtfs_mem: rmtfs@d7c00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xd7c00000 0 0x400000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+
+		/* Merged tz_reserved, xbl_sc, cpucp_fw and qtee regions */
+		tz_merged_mem: tz-merged@d8000000 {
+			reg = <0 0xd8000000 0 0x800000>;
+			no-map;
+		};
+
+		hwfence_shbuf: hwfence-shbuf@e6440000 {
+			reg = <0 0xe6440000 0 0x2dd000>;
+			no-map;
+		};
+
+		trust_ui_vm_mem: trust-ui-vm@f3800000 {
+			reg = <0 0xf3800000 0 0x4400000>;
+			no-map;
+		};
+
+		oem_vm_mem: oem-vm@f7c00000 {
+			reg = <0 0xf7c00000 0 0x4c00000>;
+			no-map;
+		};
+
+		llcc_lpi_mem: llcc-lpi@ff800000 {
+			reg = <0 0xff800000 0 0x600000>;
+			no-map;
+		};
+	};
+
+	smp2p_adsp: smp2p-adsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <443>, <429>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p_cdsp: smp2p-cdsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p_modem: smp2p-modem {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_CLIENT_MPSS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <435>, <428>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_modem_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_modem_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
+&gpu {
+	gpu_zap_shader: zap-shader {
+		memory-region = <&gpu_micro_code_mem>;
+	};
+};
+
+&iris {
+	memory-region = <&video_mem>;
+};
+
+&lpass_rxmacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_vamacro>;
+	status = "okay";
+};
+
+&lpass_tlmm {
+	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	status = "okay";
+};
+
+&lpass_txmacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_vamacro>;
+	status = "okay";
+};
+
+&lpass_vamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "macro",
+		      "dcodec";
+	status = "okay";
+};
+
+&lpass_wsa2macro {
+	clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_vamacro>;
+	status = "okay";
+};
+
+&lpass_wsamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_vamacro>;
+	status = "okay";
+};
+
+&soc {
+	ipa: ipa@3f40000 {
+		compatible = "qcom,sm8650-ipa", "qcom,sm8550-ipa";
+
+		iommus = <&apps_smmu 0x4a0 0x0>,
+			 <&apps_smmu 0x4a2 0x0>;
+		reg = <0 0x3f40000 0 0x10000>,
+		      <0 0x3f50000 0 0x5000>,
+		      <0 0x3e04000 0 0xfc000>;
+		reg-names = "ipa-reg",
+			    "ipa-shared",
+			    "gsi";
+
+		interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING 0>,
+				      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "ipa",
+				  "gsi",
+				  "ipa-clock-query",
+				  "ipa-setup-ready";
+
+		clocks = <&rpmhcc RPMH_IPA_CLK>;
+		clock-names = "core";
+
+		interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+				<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+				 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+		interconnect-names = "memory",
+				     "config";
+
+		qcom,qmp = <&aoss_qmp>;
+
+		qcom,smem-states = <&ipa_smp2p_out 0>,
+				   <&ipa_smp2p_out 1>;
+		qcom,smem-state-names = "ipa-clock-enabled-valid",
+					"ipa-clock-enabled";
+
+		qcom,gsi-loader = "self";
+		memory-region = <&ipa_fw_mem>;
+
+		sram = <&ipa_modem_tables>;
+
+		status = "disabled";
+	};
+
+	remoteproc_mpss: remoteproc@4080000 {
+		compatible = "qcom,sm8650-mpss-pas";
+		reg = <0x0 0x04080000 0x0 0x10000>;
+
+		interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING 0>,
+				      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog",
+				  "fatal",
+				  "ready",
+				  "handover",
+				  "stop-ack",
+				  "shutdown-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+		power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MSS>;
+		power-domain-names = "cx",
+				     "mss";
+
+		memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
+				<&mpss_dsm_mem>, <&mpss_dsm_mem_2>,
+				<&qlink_logging_mem>;
+
+		qcom,qmp = <&aoss_qmp>;
+
+		qcom,smem-states = <&smp2p_modem_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+						     IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+
+			mboxes = <&ipcc IPCC_CLIENT_MPSS
+					IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			qcom,remote-pid = <1>;
+
+			label = "mpss";
+		};
+	};
+
+	remoteproc_adsp: remoteproc@6800000 {
+		compatible = "qcom,sm8650-adsp-pas";
+		reg = <0x0 0x06800000 0x0 0x10000>;
+
+		interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog",
+				  "fatal",
+				  "ready",
+				  "handover",
+				  "stop-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+		power-domains = <&rpmhpd RPMHPD_LCX>,
+				<&rpmhpd RPMHPD_LMX>;
+		power-domain-names = "lcx",
+				     "lmx";
+
+		memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+		qcom,qmp = <&aoss_qmp>;
+
+		qcom,smem-states = <&smp2p_adsp_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+						     IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+
+			mboxes = <&ipcc IPCC_CLIENT_LPASS
+					IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			qcom,remote-pid = <2>;
+
+			label = "lpass";
+
+			fastrpc {
+				compatible = "qcom,fastrpc";
+
+				qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+				label = "adsp";
+
+				qcom,non-secure-domain;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compute-cb@3 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <3>;
+
+					iommus = <&apps_smmu 0x1003 0x80>,
+						 <&apps_smmu 0x1043 0x20>;
+					dma-coherent;
+				};
+
+				compute-cb@4 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <4>;
+
+					iommus = <&apps_smmu 0x1004 0x80>,
+						 <&apps_smmu 0x1044 0x20>;
+					dma-coherent;
+				};
+
+				compute-cb@5 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <5>;
+
+					iommus = <&apps_smmu 0x1005 0x80>,
+						 <&apps_smmu 0x1045 0x20>;
+					dma-coherent;
+				};
+
+				compute-cb@6 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <6>;
+
+					iommus = <&apps_smmu 0x1006 0x80>,
+						 <&apps_smmu 0x1046 0x20>;
+					dma-coherent;
+				};
+
+				compute-cb@7 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <7>;
+
+					iommus = <&apps_smmu 0x1007 0x40>,
+						 <&apps_smmu 0x1067 0x0>,
+						 <&apps_smmu 0x1087 0x0>;
+					dma-coherent;
+				};
+			};
+
+			gpr {
+				compatible = "qcom,gpr";
+				qcom,glink-channels = "adsp_apps";
+				qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+				qcom,intents = <512 20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				q6apm: service@1 {
+					compatible = "qcom,q6apm";
+					reg = <GPR_APM_MODULE_IID>;
+					#sound-dai-cells = <0>;
+					qcom,protection-domain = "avs/audio",
+								 "msm/adsp/audio_pd";
+
+					q6apmbedai: bedais {
+						compatible = "qcom,q6apm-lpass-dais";
+						#sound-dai-cells = <1>;
+					};
+
+					q6apmdai: dais {
+						compatible = "qcom,q6apm-dais";
+						iommus = <&apps_smmu 0x1001 0x80>,
+							 <&apps_smmu 0x1061 0x0>;
+					};
+				};
+
+				q6prm: service@2 {
+					compatible = "qcom,q6prm";
+					reg = <GPR_PRM_MODULE_IID>;
+					qcom,protection-domain = "avs/audio",
+								 "msm/adsp/audio_pd";
+
+					q6prmcc: clock-controller {
+						compatible = "qcom,q6prm-lpass-clocks";
+						#clock-cells = <2>;
+					};
+				};
+			};
+		};
+	};
+
+	remoteproc_cdsp: remoteproc@32300000 {
+		compatible = "qcom,sm8650-cdsp-pas";
+		reg = <0x0 0x32300000 0x0 0x10000>;
+
+		interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING 0>,
+				      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog",
+				  "fatal",
+				  "ready",
+				  "handover",
+				  "stop-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+		power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MXC>,
+				<&rpmhpd RPMHPD_NSP>;
+		power-domain-names = "cx",
+				     "mxc",
+				     "nsp";
+
+		memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+		qcom,qmp = <&aoss_qmp>;
+
+		qcom,smem-states = <&smp2p_cdsp_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+						     IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+
+			mboxes = <&ipcc IPCC_CLIENT_CDSP
+					IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			qcom,remote-pid = <5>;
+
+			label = "cdsp";
+
+			fastrpc {
+				compatible = "qcom,fastrpc";
+
+				qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+				label = "cdsp";
+
+				qcom,non-secure-domain;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compute-cb@1 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <1>;
+
+					iommus = <&apps_smmu 0x1961 0x0>,
+						 <&apps_smmu 0x0c01 0x20>,
+						 <&apps_smmu 0x19c1 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@2 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <2>;
+
+					iommus = <&apps_smmu 0x1962 0x0>,
+						 <&apps_smmu 0x0c02 0x20>,
+						 <&apps_smmu 0x19c2 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@3 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <3>;
+
+					iommus = <&apps_smmu 0x1963 0x0>,
+						 <&apps_smmu 0x0c03 0x20>,
+						 <&apps_smmu 0x19c3 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@4 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <4>;
+
+					iommus = <&apps_smmu 0x1964 0x0>,
+						 <&apps_smmu 0x0c04 0x20>,
+						 <&apps_smmu 0x19c4 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@5 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <5>;
+
+					iommus = <&apps_smmu 0x1965 0x0>,
+						 <&apps_smmu 0x0c05 0x20>,
+						 <&apps_smmu 0x19c5 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@6 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <6>;
+
+					iommus = <&apps_smmu 0x1966 0x0>,
+						 <&apps_smmu 0x0c06 0x20>,
+						 <&apps_smmu 0x19c6 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@7 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <7>;
+
+					iommus = <&apps_smmu 0x1967 0x0>,
+						 <&apps_smmu 0x0c07 0x20>,
+						 <&apps_smmu 0x19c7 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@8 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <8>;
+
+					iommus = <&apps_smmu 0x1968 0x0>,
+						 <&apps_smmu 0x0c08 0x20>,
+						 <&apps_smmu 0x19c8 0x0>;
+					dma-coherent;
+				};
+
+				/* note: secure cb9 in downstream */
+
+				compute-cb@12 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <12>;
+
+					iommus = <&apps_smmu 0x196c 0x0>,
+						 <&apps_smmu 0x0c0c 0x20>,
+						 <&apps_smmu 0x19cc 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@13 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <13>;
+
+					iommus = <&apps_smmu 0x196d 0x0>,
+						 <&apps_smmu 0x0c0d 0x20>,
+						 <&apps_smmu 0x19cd 0x0>;
+					dma-coherent;
+				};
+
+				compute-cb@14 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <14>;
+
+					iommus = <&apps_smmu 0x196e 0x0>,
+						 <&apps_smmu 0x0c0e 0x20>,
+						 <&apps_smmu 0x19ce 0x0>;
+					dma-coherent;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 6cb0dc089b17..70eb59989ed1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8650.dtsi"
+#include "sm8650-el1.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index f3ed42f81b0b..9f8ad184a82a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8650.dtsi"
+#include "sm8650-el1.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index f693ea6a5461..e22f8db3027f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8650.dtsi"
+#include "sm8650-el1.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index d25a09e162dd..a365caa28cee 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -17,27 +17,6 @@
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
 
-/* Remove nodes */
-/delete-node/ &ipa;
-/delete-node/ &gpu_zap_shader;
-/delete-node/ &lpass_wsa2macro;
-/delete-node/ &lpass_rxmacro;
-/delete-node/ &lpass_txmacro;
-/delete-node/ &lpass_wsamacro;
-/delete-node/ &lpass_vamacro;
-/delete-node/ &lpass_tlmm;
-/delete-node/ &remoteproc_adsp;
-/delete-node/ &remoteproc_cdsp;
-/delete-node/ &remoteproc_mpss;
-/delete-node/ &reserved_memory;
-/delete-node/ &smp2p_adsp;
-/delete-node/ &smp2p_cdsp;
-/delete-node/ &smp2p_modem;
-/delete-node/ &swr0;
-/delete-node/ &swr1;
-/delete-node/ &swr2;
-/delete-node/ &swr3;
-
 / {
 	model = "Valve Deckard";
 	compatible = "valve,deckard", "qcom,sm8650";
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472..d88acdb8c775 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -24,7 +24,6 @@
 #include <dt-bindings/reset/qcom,sm8650-gpucc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
-#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -1711,290 +1710,6 @@ cluster_pd: power-domain-cluster {
 		};
 	};
 
-	reserved_memory: reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		hyp_mem: hyp@80000000 {
-			reg = <0 0x80000000 0 0xe00000>;
-			no-map;
-		};
-
-		cpusys_vm_mem: cpusys-vm@80e00000 {
-			reg = <0 0x80e00000 0 0x400000>;
-			no-map;
-		};
-
-		/* Merged xbl_dtlog, xbl_ramdump and aop_image regions */
-		xbl_dt_log_merged_mem: xbl-dt-log-merged@81a00000 {
-			reg = <0 0x81a00000 0 0x260000>;
-			no-map;
-		};
-
-		aop_cmd_db_mem: aop-cmd-db@81c60000 {
-			compatible = "qcom,cmd-db";
-			reg = <0 0x81c60000 0 0x20000>;
-			no-map;
-		};
-
-		/* Merged aop_config, tme_crash_dump, tme_log, uefi_log, and chipinfo regions */
-		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
-			reg = <0 0x81c80000 0 0x75000>;
-			no-map;
-		};
-
-		/* Secdata region can be reused by apps */
-
-		smem: smem@81d00000 {
-			compatible = "qcom,smem";
-			reg = <0 0x81d00000 0 0x200000>;
-			hwlocks = <&tcsr_mutex 3>;
-			no-map;
-		};
-
-		adsp_mhi_mem: adsp-mhi@81f00000 {
-			reg = <0 0x81f00000 0 0x20000>;
-			no-map;
-		};
-
-		pvmfw_mem: pvmfw@824a0000 {
-			reg = <0 0x824a0000 0 0x100000>;
-			no-map;
-		};
-
-		global_sync_mem: global-sync@82600000 {
-			reg = <0 0x82600000 0 0x100000>;
-			no-map;
-		};
-
-		tz_stat_mem: tz-stat@82700000 {
-			reg = <0 0x82700000 0 0x100000>;
-			no-map;
-		};
-
-		qdss_mem: qdss@82800000 {
-			reg = <0 0x82800000 0 0x2000000>;
-			no-map;
-		};
-
-		qlink_logging_mem: qlink-logging@84800000 {
-			reg = <0 0x84800000 0 0x200000>;
-			no-map;
-		};
-
-		mpss_dsm_mem: mpss-dsm@86b00000 {
-			reg = <0 0x86b00000 0 0x4900000>;
-			no-map;
-		};
-
-		mpss_dsm_mem_2: mpss-dsm-2@8b400000 {
-			reg = <0 0x8b400000 0 0x800000>;
-			no-map;
-		};
-
-		mpss_mem: mpss@8bc00000 {
-			reg = <0 0x8bc00000 0 0xf400000>;
-			no-map;
-		};
-
-		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
-			reg = <0 0x9b000000 0 0x80000>;
-			no-map;
-		};
-
-		ipa_fw_mem: ipa-fw@9b080000 {
-			reg = <0 0x9b080000 0 0x10000>;
-			no-map;
-		};
-
-		ipa_gsi_mem: ipa-gsi@9b090000 {
-			reg = <0 0x9b090000 0 0xa000>;
-			no-map;
-		};
-
-		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
-			reg = <0 0x9b09a000 0 0x2000>;
-			no-map;
-		};
-
-		spss_region_mem: spss@9b0a0000 {
-			reg = <0 0x9b0a0000 0 0x1e0000>;
-			no-map;
-		};
-
-		/* First part of the "SPU secure shared memory" region */
-		spu_tz_shared_mem: spu-tz-shared@9b280000 {
-			reg = <0 0x9b280000 0 0x60000>;
-			no-map;
-		};
-
-		/* Second part of the "SPU secure shared memory" region */
-		spu_modem_shared_mem: spu-modem-shared@9b2e0000 {
-			reg = <0 0x9b2e0000 0 0x20000>;
-			no-map;
-		};
-
-		camera_mem: camera@9b300000 {
-			reg = <0 0x9b300000 0 0x800000>;
-			no-map;
-		};
-
-		video_mem: video@9bb00000 {
-			reg = <0 0x9bb00000 0 0x800000>;
-			no-map;
-		};
-
-		cvp_mem: cvp@9c300000 {
-			reg = <0 0x9c300000 0 0x700000>;
-			no-map;
-		};
-
-		cdsp_mem: cdsp@9ca00000 {
-			reg = <0 0x9ca00000 0 0x1400000>;
-			no-map;
-		};
-
-		q6_cdsp_dtb_mem: q6-cdsp-dtb@9de00000 {
-			reg = <0 0x9de00000 0 0x80000>;
-			no-map;
-		};
-
-		q6_adsp_dtb_mem: q6-adsp-dtb@9de80000 {
-			reg = <0 0x9de80000 0 0x80000>;
-			no-map;
-		};
-
-		adspslpi_mem: adspslpi@9df00000 {
-			reg = <0 0x9df00000 0 0x4080000>;
-			no-map;
-		};
-
-		rmtfs_mem: rmtfs@d7c00000 {
-			compatible = "qcom,rmtfs-mem";
-			reg = <0 0xd7c00000 0 0x400000>;
-			no-map;
-
-			qcom,client-id = <1>;
-			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
-		};
-
-		/* Merged tz_reserved, xbl_sc, cpucp_fw and qtee regions */
-		tz_merged_mem: tz-merged@d8000000 {
-			reg = <0 0xd8000000 0 0x800000>;
-			no-map;
-		};
-
-		hwfence_shbuf: hwfence-shbuf@e6440000 {
-			reg = <0 0xe6440000 0 0x2dd000>;
-			no-map;
-		};
-
-		trust_ui_vm_mem: trust-ui-vm@f3800000 {
-			reg = <0 0xf3800000 0 0x4400000>;
-			no-map;
-		};
-
-		oem_vm_mem: oem-vm@f7c00000 {
-			reg = <0 0xf7c00000 0 0x4c00000>;
-			no-map;
-		};
-
-		llcc_lpi_mem: llcc-lpi@ff800000 {
-			reg = <0 0xff800000 0 0x600000>;
-			no-map;
-		};
-	};
-
-	smp2p_adsp: smp2p-adsp {
-		compatible = "qcom,smp2p";
-
-		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
-					     IPCC_MPROC_SIGNAL_SMP2P
-					     IRQ_TYPE_EDGE_RISING>;
-
-		mboxes = <&ipcc IPCC_CLIENT_LPASS
-				IPCC_MPROC_SIGNAL_SMP2P>;
-
-		qcom,smem = <443>, <429>;
-		qcom,local-pid = <0>;
-		qcom,remote-pid = <2>;
-
-		smp2p_adsp_out: master-kernel {
-			qcom,entry-name = "master-kernel";
-			#qcom,smem-state-cells = <1>;
-		};
-
-		smp2p_adsp_in: slave-kernel {
-			qcom,entry-name = "slave-kernel";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
-	smp2p_cdsp: smp2p-cdsp {
-		compatible = "qcom,smp2p";
-
-		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
-					     IPCC_MPROC_SIGNAL_SMP2P
-					     IRQ_TYPE_EDGE_RISING>;
-
-		mboxes = <&ipcc IPCC_CLIENT_CDSP
-				IPCC_MPROC_SIGNAL_SMP2P>;
-
-		qcom,smem = <94>, <432>;
-		qcom,local-pid = <0>;
-		qcom,remote-pid = <5>;
-
-		smp2p_cdsp_out: master-kernel {
-			qcom,entry-name = "master-kernel";
-			#qcom,smem-state-cells = <1>;
-		};
-
-		smp2p_cdsp_in: slave-kernel {
-			qcom,entry-name = "slave-kernel";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
-	smp2p_modem: smp2p-modem {
-		compatible = "qcom,smp2p";
-
-		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
-					     IPCC_MPROC_SIGNAL_SMP2P
-					     IRQ_TYPE_EDGE_RISING>;
-
-		mboxes = <&ipcc IPCC_CLIENT_MPSS
-				IPCC_MPROC_SIGNAL_SMP2P>;
-
-		qcom,smem = <435>, <428>;
-		qcom,local-pid = <0>;
-		qcom,remote-pid = <1>;
-
-		smp2p_modem_out: master-kernel {
-			qcom,entry-name = "master-kernel";
-			#qcom,smem-state-cells = <1>;
-		};
-
-		smp2p_modem_in: slave-kernel {
-			qcom,entry-name = "slave-kernel";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		ipa_smp2p_out: ipa-ap-to-modem {
-			qcom,entry-name = "ipa";
-			#qcom,smem-state-cells = <1>;
-		};
-
-		ipa_smp2p_in: ipa-modem-to-ap {
-			qcom,entry-name = "ipa";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -4217,10 +3932,6 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			gpu_zap_shader: zap-shader {
-				memory-region = <&gpu_micro_code_mem>;
-			};
-
 			/* Speedbin needs more work on A740+, keep only lower freqs */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2-adreno",
@@ -4414,268 +4125,17 @@ adreno_smmu: iommu@3da0000 {
 			dma-coherent;
 		};
 
-		ipa: ipa@3f40000 {
-			compatible = "qcom,sm8650-ipa", "qcom,sm8550-ipa";
-
-			iommus = <&apps_smmu 0x4a0 0x0>,
-				 <&apps_smmu 0x4a2 0x0>;
-			reg = <0 0x3f40000 0 0x10000>,
-			      <0 0x3f50000 0 0x5000>,
-			      <0 0x3e04000 0 0xfc000>;
-			reg-names = "ipa-reg",
-				    "ipa-shared",
-				    "gsi";
-
-			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING 0>,
-					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
-					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "ipa",
-					  "gsi",
-					  "ipa-clock-query",
-					  "ipa-setup-ready";
-
-			clocks = <&rpmhcc RPMH_IPA_CLK>;
-			clock-names = "core";
-
-			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
-			interconnect-names = "memory",
-					     "config";
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&ipa_smp2p_out 0>,
-					   <&ipa_smp2p_out 1>;
-			qcom,smem-state-names = "ipa-clock-enabled-valid",
-						"ipa-clock-enabled";
-
-			qcom,gsi-loader = "self";
-			memory-region = <&ipa_fw_mem>;
-
-			sram = <&ipa_modem_tables>;
-
-			status = "disabled";
-		};
-
-		remoteproc_mpss: remoteproc@4080000 {
-			compatible = "qcom,sm8650-mpss-pas";
-			reg = <0x0 0x04080000 0x0 0x10000>;
-
-			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING 0>,
-					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack",
-					  "shutdown-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MSS>;
-			power-domain-names = "cx",
-					     "mss";
-
-			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
-					<&mpss_dsm_mem>, <&mpss_dsm_mem_2>,
-					<&qlink_logging_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_modem_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-
-				mboxes = <&ipcc IPCC_CLIENT_MPSS
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				qcom,remote-pid = <1>;
-
-				label = "mpss";
-			};
-		};
-
-		remoteproc_adsp: remoteproc@6800000 {
-			compatible = "qcom,sm8650-adsp-pas";
-			reg = <0x0 0x06800000 0x0 0x10000>;
-
-			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-
-			power-domains = <&rpmhpd RPMHPD_LCX>,
-					<&rpmhpd RPMHPD_LMX>;
-			power-domain-names = "lcx",
-					     "lmx";
-
-			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_adsp_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-
-				mboxes = <&ipcc IPCC_CLIENT_LPASS
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				qcom,remote-pid = <2>;
-
-				label = "lpass";
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-
-					label = "adsp";
-
-					qcom,non-secure-domain;
-
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-
-						iommus = <&apps_smmu 0x1003 0x80>,
-							 <&apps_smmu 0x1043 0x20>;
-						dma-coherent;
-					};
-
-					compute-cb@4 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
-
-						iommus = <&apps_smmu 0x1004 0x80>,
-							 <&apps_smmu 0x1044 0x20>;
-						dma-coherent;
-					};
-
-					compute-cb@5 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
-
-						iommus = <&apps_smmu 0x1005 0x80>,
-							 <&apps_smmu 0x1045 0x20>;
-						dma-coherent;
-					};
-
-					compute-cb@6 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
-
-						iommus = <&apps_smmu 0x1006 0x80>,
-							 <&apps_smmu 0x1046 0x20>;
-						dma-coherent;
-					};
-
-					compute-cb@7 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
-
-						iommus = <&apps_smmu 0x1007 0x40>,
-							 <&apps_smmu 0x1067 0x0>,
-							 <&apps_smmu 0x1087 0x0>;
-						dma-coherent;
-					};
-				};
-
-				gpr {
-					compatible = "qcom,gpr";
-					qcom,glink-channels = "adsp_apps";
-					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-					qcom,intents = <512 20>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					q6apm: service@1 {
-						compatible = "qcom,q6apm";
-						reg = <GPR_APM_MODULE_IID>;
-						#sound-dai-cells = <0>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6apmbedai: bedais {
-							compatible = "qcom,q6apm-lpass-dais";
-							#sound-dai-cells = <1>;
-						};
-
-						q6apmdai: dais {
-							compatible = "qcom,q6apm-dais";
-							iommus = <&apps_smmu 0x1001 0x80>,
-								 <&apps_smmu 0x1061 0x0>;
-						};
-					};
-
-					q6prm: service@2 {
-						compatible = "qcom,q6prm";
-						reg = <GPR_PRM_MODULE_IID>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6prmcc: clock-controller {
-							compatible = "qcom,q6prm-lpass-clocks";
-							#clock-cells = <2>;
-						};
-					};
-				};
-			};
-		};
-
 		lpass_wsa2macro: codec@6aa0000 {
 			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
 			reg = <0 0x06aa0000 0 0x1000>;
-			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&lpass_vamacro>;
-			clock-names = "mclk",
-				      "macro",
-				      "dcodec",
-				      "fsgen";
+
+			clocks = <0>, <0>, <0>, <&lpass_vamacro>;
+			clock-names = "mclk", "macro", "dcodec", "fsgen";
 
 			#clock-cells = <0>;
 			clock-output-names = "wsa2-mclk";
 			#sound-dai-cells = <1>;
+			status = "disabled";
 		};
 
 		swr3: soundwire@6ab0000 {
@@ -4711,18 +4171,14 @@ swr3: soundwire@6ab0000 {
 		lpass_rxmacro: codec@6ac0000 {
 			compatible = "qcom,sm8650-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
 			reg = <0 0x06ac0000 0 0x1000>;
-			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&lpass_vamacro>;
-			clock-names = "mclk",
-				      "macro",
-				      "dcodec",
-				      "fsgen";
+
+			clocks = <0>, <0>, <0>, <&lpass_vamacro>;
+			clock-names = "mclk", "macro", "dcodec", "fsgen";
 
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
 			#sound-dai-cells = <1>;
+			status = "disabled";
 		};
 
 		swr1: soundwire@6ad0000 {
@@ -4758,35 +4214,27 @@ swr1: soundwire@6ad0000 {
 		lpass_txmacro: codec@6ae0000 {
 			compatible = "qcom,sm8650-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
 			reg = <0 0x06ae0000 0 0x1000>;
-			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&lpass_vamacro>;
-			clock-names = "mclk",
-				      "macro",
-				      "dcodec",
-				      "fsgen";
+
+			clocks = <0>, <0>, <0>, <&lpass_vamacro>;
+			clock-names = "mclk", "macro", "dcodec", "fsgen";
 
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
 			#sound-dai-cells = <1>;
+			status = "disabled";
 		};
 
 		lpass_wsamacro: codec@6b00000 {
 			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
 			reg = <0 0x06b00000 0 0x1000>;
-			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&lpass_vamacro>;
-			clock-names = "mclk",
-				      "macro",
-				      "dcodec",
-				      "fsgen";
+
+			clocks = <0>, <0>, <0>, <&lpass_vamacro>;
+			clock-names = "mclk", "macro", "dcodec", "fsgen";
 
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
 			#sound-dai-cells = <1>;
+			status = "disabled";
 		};
 
 		swr0: soundwire@6b10000 {
@@ -4854,12 +4302,9 @@ swr2: soundwire@6d30000 {
 		lpass_vamacro: codec@6d44000 {
 			compatible = "qcom,sm8650-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
 			reg = <0 0x06d44000 0 0x1000>;
-			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-			clock-names = "mclk",
-				      "macro",
-				      "dcodec";
+
+			clocks = <0>, <0>, <0>;
+			clock-names = "mclk", "macro", "dcodec";
 
 			#clock-cells = <0>;
 			clock-output-names = "fsgen";
@@ -4870,14 +4315,15 @@ lpass_tlmm: pinctrl@6e80000 {
 			compatible = "qcom,sm8650-lpass-lpi-pinctrl";
 			reg = <0 0x06e80000 0 0x20000>;
 
-			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clocks = <0>, <0>;
 			clock-names = "core", "audio";
 
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 23>;
 
+			status = "disabled";
+
 			tx_swr_active: tx-swr-active-state {
 				clk-pins {
 					pins = "gpio0";
@@ -7662,182 +7108,6 @@ nsp_noc: interconnect@320c0000 {
 
 			#interconnect-cells = <2>;
 		};
-
-		remoteproc_cdsp: remoteproc@32300000 {
-			compatible = "qcom,sm8650-cdsp-pas";
-			reg = <0x0 0x32300000 0x0 0x10000>;
-
-			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING 0>,
-					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>,
-					<&rpmhpd RPMHPD_NSP>;
-			power-domain-names = "cx",
-					     "mxc",
-					     "nsp";
-
-			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_cdsp_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-
-				mboxes = <&ipcc IPCC_CLIENT_CDSP
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				qcom,remote-pid = <5>;
-
-				label = "cdsp";
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-
-					label = "cdsp";
-
-					qcom,non-secure-domain;
-
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@1 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
-
-						iommus = <&apps_smmu 0x1961 0x0>,
-							 <&apps_smmu 0x0c01 0x20>,
-							 <&apps_smmu 0x19c1 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@2 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
-
-						iommus = <&apps_smmu 0x1962 0x0>,
-							 <&apps_smmu 0x0c02 0x20>,
-							 <&apps_smmu 0x19c2 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-
-						iommus = <&apps_smmu 0x1963 0x0>,
-							 <&apps_smmu 0x0c03 0x20>,
-							 <&apps_smmu 0x19c3 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@4 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
-
-						iommus = <&apps_smmu 0x1964 0x0>,
-							 <&apps_smmu 0x0c04 0x20>,
-							 <&apps_smmu 0x19c4 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@5 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
-
-						iommus = <&apps_smmu 0x1965 0x0>,
-							 <&apps_smmu 0x0c05 0x20>,
-							 <&apps_smmu 0x19c5 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@6 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
-
-						iommus = <&apps_smmu 0x1966 0x0>,
-							 <&apps_smmu 0x0c06 0x20>,
-							 <&apps_smmu 0x19c6 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@7 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
-
-						iommus = <&apps_smmu 0x1967 0x0>,
-							 <&apps_smmu 0x0c07 0x20>,
-							 <&apps_smmu 0x19c7 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@8 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
-
-						iommus = <&apps_smmu 0x1968 0x0>,
-							 <&apps_smmu 0x0c08 0x20>,
-							 <&apps_smmu 0x19c8 0x0>;
-						dma-coherent;
-					};
-
-					/* note: secure cb9 in downstream */
-
-					compute-cb@12 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
-
-						iommus = <&apps_smmu 0x196c 0x0>,
-							 <&apps_smmu 0x0c0c 0x20>,
-							 <&apps_smmu 0x19cc 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@13 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <13>;
-
-						iommus = <&apps_smmu 0x196d 0x0>,
-							 <&apps_smmu 0x0c0d 0x20>,
-							 <&apps_smmu 0x19cd 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@14 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <14>;
-
-						iommus = <&apps_smmu 0x196e 0x0>,
-							 <&apps_smmu 0x0c0e 0x20>,
-							 <&apps_smmu 0x19ce 0x0>;
-						dma-coherent;
-					};
-				};
-			};
-		};
 	};
 
 	thermal-zones {

-- 
2.34.1

