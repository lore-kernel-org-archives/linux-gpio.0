Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E6846C859;
	Mon, 21 Sep 2026 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985069; cv=none; b=lNoOgKPY3cjWZc3LDTSSN4KddL/iEXdAMvJJrtv2rwKQNsizB/ffMFcSGkcRzuqp//XYxXY29KDDnYl6cNSi0z7OZWlRZIUyBm1GD4tIwXZIfU1K+kDIg7VdPdVVioLivw57dGU5uaQhzgOrL40ub19K+A6ea37G0QJ50IaRnno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985069; c=relaxed/simple;
	bh=J3G1XOgEGyUEGCnYT9ndKultr5rQzQu//Zfvfn/nyg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXynWSTpDgu1K56kET2hn3/xGMw5UaKgE1NRDguiPyOzYVROookLprgtHWNUi9B66Ve2cw99t5RwaPJLPf71j41sDaWA5pR58e8wwLdMp4w8ChBAM2vRlqgjC0Cq8XvcTXHcFH+VPk2x0GsLF5QNLS8zR1tokuDRwemIKXdrprk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=IzLBqfXu; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="IzLBqfXu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description; bh=vUrv4dKFZHvoMjiZaM/UQjVujiL3fg+yNBiJxL3e+tI=; b=IzLB
	qfXuwEBBwj0PhFsGsj+OyPk8yo4eC3PEyz82Yp9Hai/+diKZLiJuzCsVnFt6DHRrBEc/u8Befwc2f
	DViZzcNmguu+bokyc6MoLdJaKmTodNy7b48A7AIhePBpIWa/ffmF5GXNNsxwJ2/2LfAjRAxOwb94l
	Q2CdLWJBxocLjJ8OOadERFNiaPVjL/SU6zgwh0oRy569v7sxIKvy2YrN4FK8Y1IwxV6jz6/kYggbv
	/8+aGz1ITVKpwpJQyIYjTjITc3j06uqEdLkVdWbK07gHk5hBtj+JW4ZOvjuprr/ji9XD8hAYut2lt
	j+H5xPNrbC+WtcQ7nbB/f206T83LHA==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1x8aXb-003NLI-0F;
	Mon, 21 Sep 2026 09:42:27 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] pinctrl: axp209: Drop check for disabled devices
Date: Mon, 21 Sep 2026 11:41:46 +0200
Message-ID:  <40e52e7300313b33d7c49e9edea71ec98808c7fd.1789983244.git.ukleinek@debian.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789983244.git.ukleinek@debian.org>
References: <cover.1789983244.git.ukleinek@debian.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=ukleinek@debian.org; h=from:subject:message-id; bh=J3G1XOgEGyUEGCnYT9ndKultr5rQzQu//Zfvfn/nyg8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqsPvezBM24sw6ksLZrgu17a2imrDm2cwVGmxZN 7MNyR12y26JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarD73gAKCRCPgPtYfRL+ TkeSB/9c1Lkq01EBbbG2mF/yzeMSnwH5l0Aak9xTG1X2MPOXlo6NYbosouBvSuw53xgMjvjH8wo 6esJOsR3+iU//EGJy8AblL5KD2eJzM5vxiyF7Y3BoRcENSUVbbRwU6P2MiTC1/wO3Bo1VnM+dE2 unmEKUyyxbFIWSEBGZjTtzLvr82t44ko49Q5wisnHlpIZrXWbBeIUo9WG04lILkvh07yS+nUy+d drcm3zFbupF3+RSGOZt8JcYssp07H3G4why2CGST4bcKp+O0fSajBHi6ozRIYX1EBpGLBuRfSzf iEebc2GwOisVtJc52pdfznd69wA0xy+JwA143AqldXsIeWP6
X-Developer-Key: i=ukleinek@debian.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 6b5c350648b8 ("mfd: mfd-core: Honour Device Tree's request
to disable a child-device") the mfd core checks for disabled devices, so
there is no use in doing that again in the mfd child driver.

Drop the check.

Signed-off-by: Uwe Kleine-König <ukleinek@debian.org>
---
 drivers/pinctrl/pinctrl-axp209.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index 2bd8487484a8..5539ce642b39 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -442,9 +442,6 @@ static int axp20x_pctl_probe(struct platform_device *pdev)
 	struct pinctrl_desc *pctrl_desc;
 	int ret;
 
-	if (!of_device_is_available(pdev->dev.of_node))
-		return -ENODEV;
-
 	if (!axp20x) {
 		dev_err(&pdev->dev, "Parent drvdata not set\n");
 		return -EINVAL;
-- 
2.47.3

