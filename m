Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737D112CDA5;
	Mon,  2 Feb 2026 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044316; cv=none; b=spjmFrZIrChcVj2/mZtWG9WWAtqkh5klLfOH5EQnZr5zTUetIoxfvdw/KGADRMpR2+sjnZvm8stciP2o3mNJeIZxLKMF9er1UFTNhvONbLWZ+R4F7GkG5Sk1yiYAm67RtFY0edSYLB9CTcOLz9dx+oCyr6hjTZieYqlbICPzKdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044316; c=relaxed/simple;
	bh=Hhd3Mp4IY8KKcrxtYwkbgAE7eecAEBl7GxTkMMe/JSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TA+MThOSWSOHZJKVPxLs98/+S5O+rJj0RHk/49sj2/A777gYn/eR0zZE8Qxx6WP33lT8PHrAlIWNRSREV1BFQA6zz4TiXM/dUcLCciAWw3HDWU2hkk6LWC3uM1Ho+KkXK1u+5jqQdVXafjVmUmIIOd1mFleEt1ZfzjMO1YZxvRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBUSvm7o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBUSvm7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474B8C19422;
	Mon,  2 Feb 2026 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044316;
	bh=Hhd3Mp4IY8KKcrxtYwkbgAE7eecAEBl7GxTkMMe/JSw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hBUSvm7oC36YdKTw/st4ULrfdjmskKu+KMgc/h+lxBnTxDKhiCjhjy8YvxyPmxdDq
	 Vl7wOd4d/DLFBTNJZiKdXVtm0V6qCccnTdW9F+y0IYkhXpvjUyUm8V4YYvOJnA2b0o
	 P0GHyovJRoUGLU5V0Z3OuuaDTpZ+Gfmo6L2k0HxBCQ1cst3dnhzXzLBNtFDSAZ3oWR
	 ci7bcK5pJbWh6gWkQDurpS8AXtgbwudT4jTI3O2OSBUj5T447sde32Ex5MYcHBvYWh
	 1k2mqo4NRaTDkInNsohVRVi8scMmK9HxcGxeklXGwegEUr4u+INeNYtnZ0NJdXpjCY
	 TSMPgIV7VcOYA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Feb 2026 15:57:40 +0100
Subject: [PATCH RFC 8/8] arm64: defconfig: Remove CONFIG_SM_TCSRCC_8750
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-topic-8750_tcsr-v1-8-cd7e6648c64f@oss.qualcomm.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=641;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bDS/jkoFJ1ukXGTfmDplN1g8p9iDRmyWVj5k+p42CQA=;
 b=3kBjEObnUN8G6sx4+1Jzher/Uq++6EOM96r0H4I0PVQ5qCN3n3GOvQxe3EZAXyUs1Q8Kziawd
 qzUFefLN3NYA94S4S/Zu/k3SkV+TcH940IuZ3XdrXe9o+koYtIgJjLi
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The driver and the config option have been removed. Clean it up.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..dd37285e223d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1552,7 +1552,6 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
-CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_6350=m
 CONFIG_SM_VIDEOCC_MILOS=m

-- 
2.52.0

