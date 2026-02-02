Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DBE376463;
	Mon,  2 Feb 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044311; cv=none; b=JYbLJ2dZLyxWBTXlL5FpavxZekYNVEjCsqGM9cuOaVpL0j26pd7FpwOphq6+VTE54exeg1U71K1muQtRPRrrZ4jI/vrOthKaWOdiKVVtDCiBj7w4RvBSQE9hjMyndW3s06GV3ST/F0gMfw1+RxK+PngiRqDyNsyFe8HhQQZzRTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044311; c=relaxed/simple;
	bh=/IpnK7ByaXPMNqDc0727rQqbiUFecqNF11bxoR4jwp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cP9WVk9i4xAJrjKT7Aza4/Iu4WdJxhyjN/VfN3h21zoq9iWdsw0Ld9CgpSib1RZNdUVkJ2NCcNQ/OL/8F0YAeurcJxxxe+TykYpKLnUF40xRZ52LJrkP3GGcv6/nTjlUqQ7qom/67QW01g8NeRbAvHUpO0rbu1HYg14GCesekAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIuYoNTA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIuYoNTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23F5C116C6;
	Mon,  2 Feb 2026 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044310;
	bh=/IpnK7ByaXPMNqDc0727rQqbiUFecqNF11bxoR4jwp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oIuYoNTAMpbwz43hwhDH9Bq9OgCwU4WaoK9xl1iOkxnSvNBbXAiiqvpq6xdlJxaAP
	 fiLVosoEa1/JjfGed0xY4gwVhSVVx38ShTnUBSl2kfADVvd1bvK14z5tdXTYttcRwN
	 GhkkMa7yzhS9eoZQI37Bc2U2CIQMsDmhW0/vHT63Pfj1zYn/QrtKreYw8/YZxWNZlG
	 fgdtVYpLRjbUKmyk5DZdjAKVubi0j0I6t0AmLnLLEYVeQXtrowI9NtV9B+qVEw89N5
	 Nb6Qim5c8UMqvbRGlxNelu3ThNa7UCKi6kHdhDUDNdY7mVRR/SIl+9Fi76AVWv9+R9
	 u4GMRhJqcA8wQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Feb 2026 15:57:39 +0100
Subject: [PATCH RFC 7/8] arm64: dts: qcom: sm8750: Describe TCSR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-topic-8750_tcsr-v1-7-cd7e6648c64f@oss.qualcomm.com>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
In-Reply-To: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
 Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=1024;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=jVDDn9QNs0ZFz3NPDW/6/+SSCoco2pbJIqCtvCOQRYI=;
 b=r5jROK82lih/SxgAjgWIUEygV+rXtstxMPaEisYlSojcTEHp+lHU3vU98kaNPn/XioXv7Xrpd
 thcfiXGxtPJAqEkUirBE+liLG23MPOM6TM7azcYQphj3P6gsEHAjrLV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SM8750 features a TCSR block (like any other Qualcomm platform),
however unlike its sibling platforms, it most notably does NOT contain
a clock controller, where XO-fed gates would reside.

Describe it.

Cc: <stable+noautosel@kernel.org> # complex dependencies, no immediate gain
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 0c034ba0517f..7ccbc3ad212b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2124,6 +2124,11 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: clock-controller@1fc0000 {
+			compatible = "qcom,sm8750-tcsr", "syscon";
+			reg = <0x0 0x01fc0000 0x0 0x30000>;
+		};
+
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8750-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x10000>;

-- 
2.52.0

