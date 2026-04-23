Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875653C942A
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 04:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919416; cv=none; b=YN94e174u1ftRKCzThkhQHCLBlDgWGrr2cQUBTumCsZBO/MIICS7ENDYwcBaWDMKbYXEOGAL5ugFGm2ytgR9bLzhm9b9PDW4XZFNY/tQX65F0O7yO8Wvx4QizuivpAs04DtNM8FnyLsx5O0Prq6Eyyn8HHlwSTgCc3BPYNNSis0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919416; c=relaxed/simple;
	bh=AsBjo9G6XCBgU9iaZo6xvX9NeAmRhMKLBfe3zu26hr8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kwGJJMQMDPpf95Pxyx3Z30EorpRPbv0YcsTmh9eo8FIDczRwfKd0HEqrmSE8iilUTwCzp5JSVPDliQENtNOvB/O5ckCGZvRjaWeETLsmC7cL7BqFzv6CnY3R3I31JNdIa4+yD09bXjeQ+Iz/GsFd253/2JwUNU2VVO8ouNYyaro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oixfULkC; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oixfULkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776919397; x=1777178597;
	bh=7kM6wcohx5ePIqW7kIjBx9vneYoeALYmh0GKIfF/bxU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oixfULkCDLKpTBRqFtRxYABnON0vxEza9DYV6vxfO0hy2YW0qinFyUb7cEMInzOEo
	 2UItP5tSVeLpl7rFpHtdxrUVsx9D1q1RmzqPlfnBexluARyjvbtFAIaUN0tknNpzz3
	 JmXTKdSKbi8Q9s6sbcdTa43sGFiOiSCCzAIXxxNmPCx1FRyiAjDGKX61x8r45JKQb4
	 tGGkNDNfVhgvmr4ClD5mC6RF54rkswdbQirLqqfXgvaYTBjSSXEwd1RoO6fkBiIt9X
	 fV84Fp9gqefuMuuQeM4508c9bwG0qY5mp0j4MU0E3nPvX0ul6uwq4ES5k9RmFMhEm+
	 gEBh7sJSx5VfA==
Date: Thu, 23 Apr 2026 04:43:11 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 0/4] pinctrl: qcom: eliza: Split up some QUP function groups
Message-ID: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 73b9b35bce1a74c753d196c609e1c893784ee197
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Problem with previous representation of some QUP functions in pingroups
was that if they had the same name as another function on multiple
slots on a pin, the latter one was effectively unselectable.

This series splits them up and allows boards to specify exact routing.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3
- Clarify commit message(s)
- Also split qup1_se4 (has same issue)
- Don't unsplit lanes that don't need to be unsplit from base group
- Link to v1: https://lore.kernel.org/r/20260420-fix-eliza-pinctrl-v2-0-b68=
329fd6701@pm.me

Changes in v2:
- Update bindings to reflect new split functions
- Link to v1: https://lore.kernel.org/r/20260418-fix-eliza-pinctrl-v1-1-864=
bf95ac83b@pm.me

---
Alexander Koskovich (4):
      dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP lane mirror alternat=
es
      dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP1_SE4 lanes
      pinctrl: qcom: eliza: Split QUP lane mirror alternates
      pinctrl: qcom: eliza: Split QUP1_SE4 lanes

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  26 ++--
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 162 +++++++++++++++++=
+---
 2 files changed, 154 insertions(+), 34 deletions(-)
---
base-commit: 90700e10d2ad61c13a5117cfa5e08d9f2e497dcc
change-id: 20260418-fix-eliza-pinctrl-b6e66dd92766

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


