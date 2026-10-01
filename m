Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED278522F13;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878456; cv=none; b=OWVgGsO4GqR9Fk1cO7Puzf2zcAryLxaaYESUXzD7CN/LnRKoWcSf74gfsYLXW9KLibDb4pkl3Qz+OV24lUzN6VxC2LEbyKIMEZi7Eim+czk8RTV4RDe0FD7FtAVNZnRMINbyFbxTtyP8Cq60z6gFldEW+fEI+usmoA4uAiV0tsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878456; c=relaxed/simple;
	bh=jk9WrNQmxQdqtC1QZp9FtvvRcQ5EK8qJVsNHKLYcB4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a+riySt5iNJaesEkZ1SBp3GI4BESIs0AIR/ajEDxVN86wlrm4jx1Nu68abC7x4d3MmLDEcPxEKlFyxMR+2SyvMk2m1gZfc4eHWMQH/vwQpGabImjr/k8YBsCg6oGu3ogbKGbBnzFFZXEVLYzXT2TbFm4MZoBV44IDkvtPJ8pjH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk2okI1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk2okI1M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56395C2BCF4;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790878455;
	bh=jk9WrNQmxQdqtC1QZp9FtvvRcQ5EK8qJVsNHKLYcB4M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bk2okI1Mis4aX1w64MrTNhiywGaaac2Vh1vafp7y5ztDLKb5nWuOXd1Zz5RqzXLO6
	 vm/wcCiUHjGNq/2+J4Qv8ol6L2OyxwkF4BxfAjUSVj7Ey9OUHoToekM6KdA+5u99ny
	 on9pJ0dzgGf5YnedunlLkRnpUcDaxP9ol3ouHPS8RgXXaJQbjCrBENUrFhs2OZzfBg
	 fImkhKUqZQ/ZTwTsb26PcGrBG0pOKkxOJuU/PFFp0yqY0f/XbPv/XbpnhnEgoYQdDA
	 UNJcCc63dFXMZCuR7xdBRsGFLIwpLiesKA721qG4aVWYA1YJdIZzVADS/A6m+myHqj
	 VgxhvI8bW65uA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1FBCA5FD2;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Subject: [PATCH RFC v2 0/4] gpio: loongson-64bit: add interrupt support for
 more models
Date: Fri, 02 Oct 2026 02:13:18 +0800
Message-Id: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL+ivmoC/1WNzQrCMBCEX6Xs2Uiz2qTtSRB8AK/SQ3/WdKFtS
 iJBKX13Q/DiYQ4zw3yzgSfH5KHONnAU2LNdosFDBv3YLoYED9ED5qjyCgsxWbsYH7WyFSVWJZ7
 b01AohDhZHT35nXAPuN+u0MRwZP+y7pMugkzVj6b+aUGKXGg5kKaOuk6ri5lbno69naHZ9/0Lk
 HguGK0AAAA=
X-Change-ID: 20260925-loongsongpio-829824a3d562
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=jk9WrNQmxQdqtC1QZp9FtvvRcQ5EK8qJVsNHKLYcB4M=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqvqLfOtk3ZZLskew3wfMsPMJh+Hn9vAZnFdMAI
 cRp3gIicl6JAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCar6i3wAKCRCwMePKe/7Z
 bkdqEADUsiQ0n53zh23dlMfmWYZfUChZTO4wroE07UZNHv0Bgag3j3DQAajpmT6UquoTPudMvuK
 oxzZm6jEEpLc3ZEXhfDmE3cB0UPGOogCI/zuFNWf/w678xfIHSiQ44ebmffTpUThO94bPR/675B
 f9AKnLGracMi0mrm9eRX4mpjPER7V8b7/nDnuUkCvSahfVakPnSjkze3+itsGQMyQYmx8FCMxG/
 YYy1lKtWDKNgGBhXcswxg2IP8ps2Feh4lnpLfN55e6JtvNpVn1ax2q9VGYlh5JpWCy9Cb0nn2iZ
 V3/qAEmwTZMA+CCTK3rzmFXFP+Oes3j25G56wBt71i2zmFGI6QkwLKwxwYbCdahdkL1o4gHnWzM
 WmzZnBUbwjPUmFL3iTgAEubFj/+2TPRiTPuY2bAlT91v5vDvjkqm8J/LUXvh5X2SfWlJE2vfQEL
 QV+sEY311Y2SVL+h70EcGjrBWk3qy2q/StxW9unoMOtf2hsyBRCkJczHYu08VC6hYjcBhuMGMxK
 /6xuXo+yo1+ff/KDYGXPiEnPrLj3GPkmz/68SW/acHv9FZWIIBl3Db7Rqx+Eg2cP36vq0LmiF6B
 5V1ig9jolVICO/WbMeTFtvtyvfyKW2rLJEF8oMwvX8nqG19tGGbB6u/M/i47q/xIhEwGnaqFK11
 UpufhxxRceYKMig==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

This patch series aims to correctly add interrupt support for GPIO
controllers found on more Loongson CPUs. The GPIO controllers in such
models do not have a complete intgrated interrupt controller, but choose
to delegate interrupt handling to their parent interrupt controller.
This sounds like a heirarchical interrupt setup, but what makes it
more complex is that multiple GPIO lines in these controllers may share
one interrupt line on the parent interrupt controller. The details is
described in the third patch.

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
Changes in v2:
- +Cc: linux-kernel, as required by Bartosz
- Shorten the names of struct members to increase code readability
- No other significant changes
- Link to v1: https://lore.kernel.org/r/20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com

---
Miao Wang (4):
      gpio: loongson-64bit: Support for irq controller on 2k2000 and 7a2000
      gpio: loongson-64bit: Generalize interrupt controller initialization
      gpio: loongson-64bit: Add shared interrupt support
      gpio: loongson-64bit: remove gpio_to_irq() handler

 drivers/gpio/gpio-loongson-64bit.c | 706 +++++++++++++++++++++++++++++++++++--
 1 file changed, 681 insertions(+), 25 deletions(-)
---
base-commit: 481ed5dd3ed7136f627b8ec372ba39f5b2e7d27f
change-id: 20260925-loongsongpio-829824a3d562

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>


