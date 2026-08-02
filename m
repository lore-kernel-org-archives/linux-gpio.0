Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFFA2BD5A8;
	Sun,  2 Aug 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785656050; cv=none; b=V622o6YeANWTgc5YMlpp7kJQlSfv0jKXcwdOrfgs1CnIbFefYj7QCFm2+UQvfgdlD5guCffgcRGUu1qP3hfYTdnH1PwZsj7npB589d7sAJ0QpY0u2xUItwyXUYwN6VUtXBDo3KIddSp1RvMFog8tVq5OrGZ7AW9QsIwXSlNswwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785656050; c=relaxed/simple;
	bh=pXMLD4fyMGyvZKlW8rUiXgDCYGnW5xakPv3hdEooDyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3MMKZMjarDEpqQhog1dROCC7ifYSYYJ+MXOhfY0laGRuuO87Q/n+k7lKJOgEVvbiCQaiSjeMgenOq8fjU2NAR1HIAK3Kdfi7b8PyMudvMnTLxZRPEg0BL0gO+dBb0mF8qnDLSAA7c2XDOIeg91o9eQbPg7OM/6hju9heztcBK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRRPPiJD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRRPPiJD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4986C2BCF5;
	Sun,  2 Aug 2026 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785656049;
	bh=pXMLD4fyMGyvZKlW8rUiXgDCYGnW5xakPv3hdEooDyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fRRPPiJDShbZ8VjzdZnEzLSQqorab1/c+4TP3MwPaB2CxDABqZzmxjbjWY3Kzc0Wi
	 Utq8gOrC3ESq2bx70rhL+p568ycSAvuo42Q7NjEHzqeoUKzoU3fLnfyHjPgdoXzGPF
	 icHP90tzY0M2AlryYpcwr8UkAuDuKi5C6ctKW4QRa1oZr0gMXRITMg2uMbwAe85ky+
	 NTpaxP9QsF0mklV6dodPZdIpCk2I6HwxQFrCRS4a2nz7TH+XkCWA5poMjM6q5OhGpf
	 F+sUIUsD7mxMo4JFrJqsJYK9/TqHcKS1EsiepUHnGHU4APcE8tiZjV+ruoCzls6LDB
	 zix9w1cjEGNYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC848C55162;
	Sun,  2 Aug 2026 07:34:09 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sun, 02 Aug 2026 03:30:54 -0400
Subject: [PATCH v2 1/4] pinctrl: qcom: sm8450: Remove duplicate reference
 to gpio81
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-sm8475-tlmm-v2-1-a93e1d1cb53b@proton.me>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
In-Reply-To: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785656048; l=759;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=n3jh4Uj3nEySZi7aHaFMNoe1kPorY7QnSDR1AOA3wjQ=;
 b=vIlqVCtvW62RJAYsVjChLseYjbfg7mSs00DqW0UBU0DfryjTNRxHRBlhn2giIj80SSD6sYbRF
 tDv2NvkTuW5BL9WQNh5Cjc+mj/CCPksN3I4MXmqaEodhLKQWeQifT/r
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

gpio81 is referenced twice in prng_rosc_groups.
Remove the duplicate reference.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/pinctrl/qcom/pinctrl-sm8450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450.c b/drivers/pinctrl/qcom/pinctrl-sm8450.c
index 8ca5b6e15e6c..8bb6702cebe2 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450.c
@@ -962,7 +962,7 @@ static const char * const pri_mi2s_groups[] = {
 };
 
 static const char * const prng_rosc_groups[] = {
-	"gpio73", "gpio75", "gpio81", "gpio83",  "gpio81",
+	"gpio73", "gpio75", "gpio81", "gpio83",
 };
 
 static const char * const qdss_cti_groups[] = {

-- 
2.55.0


