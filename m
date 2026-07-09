Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE967466B4C;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617885; cv=none; b=BDNN6NrBoJeNNRURM/yJjSFWTrvtfYWrNBhjAbOm1bx40PvxPT++ANwOvCN98T4m/M9RtwGgC5OFDHt9NGZ6tqutAGl7LafjaWmd0B0Jm/7EpZBlhbZ+dscmBM0jpYECyOhEH/Wt/Xo2ufhN1LTlxivZRTLV72KbDonUR6DPC9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617885; c=relaxed/simple;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbbR5bfo38l55WyA2jjtzZVF+he9WLTVaWfj/y44kZmZZXGAhq/oDgMO89tP5rGSxbcIWx8NbOfXUxXmqJx8WB9hcU06yQ6sEvKRYiHnY9BBlhZEcQP2UD0smmS/bMlYP9jC/piX1nu/wF4apkL4ZU6PYDJrlFt3pW9scXFM6u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy89Y128; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy89Y128"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51ED0C2BCFF;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783617885;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cy89Y1288Ev1qqON71vph0CAijo5j7F1wrkgryWDzPGYNHYdT0Ah2NXv5gG64LfP2
	 2tAruV/MuuSdZmvdtXZ4pMss+fvQ3NZUyqGFhMg2k1DpUeLQnV+QJgqcYVhe86K/0E
	 qu+FiWae2FOtpFvZxu/6R9cfA4YoAtFwIWpGbATg795qSBsitPNZt2Xqj3UzujxrJV
	 s0Rl1I6k+NOchR3Ox+1jcUN0+pKgg6fzvR7piEcXstWBr1kNaVBPdZsuJwI1PMIiZU
	 7eAvkybpB/G+Pi/6w5D4RJYjhJcl/wXEn+k3dPnkR3l/AwMmo/mUdn05/bZfGFHrM6
	 TVJVvh9aZ0bgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F277C43458;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 10 Jul 2026 01:24:22 +0800
Subject: [PATCH RFC v3 6/7] mfd: ls2kbmc: Able to be compiled as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ls2kbmc-mod-v3-6-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
In-Reply-To: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=726;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=4cYoUAWfr6lC2eTeoh29c5JZOLqOi/IiHDJf/iiky6g=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqT9la4CJbrSXeiOdx6rKWijSotf1UR0bj6PC4l
 uz6ToNr+TSJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak/ZWgAKCRCwMePKe/7Z
 bmhwD/47GGXrGDaz5O7vrcrXTU+qDXUIultuqzdjvPV4LcSfNxHp21AC1XneWDecbOOyHoVvsdy
 a1cVf7Rmkh2Rq5h8wXCby7bDYGb2R9cY2/Ao9jaO0zBHhWX6dGxYw3mc50vGeg7IGowBlZ4OtL9
 iU+aLjfy6NpJP8AqWefP+/8H2iQuWOKgnPne2DfcuQcVG4ToavmRDGM0CseukvIwWIsgFCoIMWV
 l0xEpBLtqe+J1qgqNLHEmJVRdolvh6MMDcO9vXY+mJGbZ0+xy7D0X+GNPNX5W0KgwUW38ALawBC
 bi0gcZb2eAwbCTQldWdQkrQdGZjRoGLgUPUOd83TkBgj/xK2SgTg98h5GPw9h5+9goA7A+Fg7Fc
 9SmdTLaZYSDOE5WZKaS3QSWqxvT9znYRJplS4jBkTMt6BKD3CuBuVORlkg+z4zEEalDqKiIE/+Y
 gxY4K6xAQ4q9PjhgsAf6nzjBsK27/nHAk5ASI3b515lvi08E13J8Xi4iGW6WRETBMaSAFviZ0L6
 4wt32DLNKJY7W83oNovZOmC6Yxl4djFpssD7adyS/t8YGntYCYmdV5i9bv9oSoR+ebvqhTjFoLt
 FrW2atkd41bUfd1ki75n8z1Jeu+f328UwnZISNvOcPEDHhimb4Lu5DFGhgA7WDAa3QuJNVzhWl1
 NCdZrAe4tRJ04ww==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

Make ls2kmc able to be compiled as a module

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782bdd5d2b1a4d840c75b040092d83e..a7a9f97af248c88489dc1203a1ba05f2ce4827df 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2494,7 +2494,7 @@ config MFD_LOONGSON_SE
 	  which will forward them to the corresponding engine.
 
 config MFD_LS2K_BMC_CORE
-	bool "Loongson-2K Board Management Controller Support"
+	tristate "Loongson-2K Board Management Controller Support"
 	depends on PCI && ACPI_GENERIC_GSI
 	select MFD_CORE
 	help

-- 
2.49.0


