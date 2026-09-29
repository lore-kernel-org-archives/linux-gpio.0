Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7825C3B0ADE;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715118; cv=none; b=RTtY1DFNEvy6+Q0XTHJ6Yl0HWKIgTLLrvn+mKIKxTLsoMQFOB/P+TmIzxvFetmUrlIhIELKr06CwbcjQx27HyaDhqD7UWaA3bycVg5H9GfcTWzI1qBZXQbKkxmFCmzxfVUNoum7H+kwaCMx8yI8p7gzafcAJChY9wa16boSXmME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715118; c=relaxed/simple;
	bh=yMXlm7fl8wPjVC8wr1zDe/3bBhAXU0dk9oPkRIGtYbo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fkjh8Y6y0XJLNee9VmTBSDsWNm7gmdkNpofxDvDuGYsND9TduOHK6cb7ZFIT6ufEontsvTZ5FJUB2vJgq6Z5U+NC1qogT5QIUDfXtDGPl9XBJCoLAwk+SmOpul8XvcqDaYulERywZCzecWmeqnCXmuDrGWNJapwd9CvQCA3lBYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrF+oqSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrF+oqSI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A9DDC4AF0B;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790715118;
	bh=yMXlm7fl8wPjVC8wr1zDe/3bBhAXU0dk9oPkRIGtYbo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WrF+oqSIrj1h/LfB3N/GfBA3AbAptzRUAdrMaxXSD6IPuQhN51GLXMTYsP+KorDa4
	 Sc96thbiEoyPACcBXliECuI21+zMxc0tTIT6uqeOKgIz11yX8uBJpJC0D+UbnzLjF0
	 omXqO2UfjddcY0Cyhy04gtIgC9f8txyFEVC3Sn4SRGqcC0jXVIKGepBi4Pooi+m288
	 xgRMkLPhT916Wx/yH3cAK/A6v9YZdg4508XxvnmiHqPvFfl5TuqAql7wrs9kAkoHwf
	 lFdRxyy59YJkfmRUqsV3bNQkZvJmCA4ASmKS0ohwIfGKNvuuoOE2HxhtXlxrc1COdA
	 geRYweKToprOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E10CA5FA5;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
From: Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Subject: [PATCH v3 0/3] Migrate the multiplexer subsystem to fwnode
Date: Tue, 29 Sep 2026 22:51:45 +0200
Message-Id: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ6CMBBFr0JmbQ0ttqGuvIcxpjJTmUTBtFoxh
 LtbWEni8v2f90aIFJgi7IsRAiWO3HcZqk0BTeu6KwnGzKBKZUortbi/hrN/dz2ScNJoWzWV9R4
 hC49Anocldjxlbjk++/BZ2knO699MkkIKQu0M1vnH3SEQusC37Z1g7iT165qVq7Kray+x1heLS
 Ct3mqYvpzksaOEAAAA=
X-Change-ID: 20260915-mux_fwnode-a16593c39ffd
To: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 xu.yang_2@nxp.com, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Fabio Forni <development@redaril.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874;
 i=development@redaril.me; h=from:subject:message-id;
 bh=yMXlm7fl8wPjVC8wr1zDe/3bBhAXU0dk9oPkRIGtYbo=;
 b=owGbwMvMwCXWeKho1tqFWemMp9WSGLL2qLxZdVdt8c6NVcu6tcrsIu+tNl7gH/TIQeuaDOvV5
 oL1bwRbOkpZGMS4GGTFFFn+Oxlt6jYzMbrVL1ELM4eVCWQIAxenAEwkeQfD/1ANw/TrhtvyDmW7
 rZ95id+442Dtzp3p7IptArE9R1x3mjAynL4amXfmx/klC7bKrmhrfT3VyfxqBcvz+eee7n+c7/S
 giwkA
X-Developer-Key: i=development@redaril.me; a=openpgp;
 fpr=FF4232B28B363432DA8F187D81C2729AADA16A67
X-Endpoint-Received: by B4 Relay for development@redaril.me/default with
 auth_id=1033
X-Original-From: Fabio Forni <development@redaril.me>
Reply-To: development@redaril.me

This patch migrates the multiplexer subsystem from using the of_*          
family of functions and structs, to the more generic fwnode framework.     
                                                                           
It is a rebase of a single commit[1] contained in a old patch series[2]
submitted by Xu Yang. The original commit plus follow-up comments were
tested on kernel v6.12 on an arm64-based board, but this current rebase
isn't tested yet.                                                  

While at it, a use-after-free bug was fixed in mux_get(), as suggested by
Alvin Šipraga.
                                                                           
Link: https://lore.kernel.org/all/20220823195429.1243516-3-xu.yang_2@nxp.com [1]
Link: https://lore.kernel.org/all/20220823195429.1243516-1-xu.yang_2@nxp.com [2]

Signed-off-by: Fabio Forni <development@redaril.me>
---
Changes in v3:
- Expand documentation of mux_chip_find_by_fwnode().
- Fix use-after-free bug in mux_get().
- Link to v2: https://lore.kernel.org/r/20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me

Changes in v2:
- Rename devm_mux_state_get_from_swnode into devm_mux_state_get_from_fwnode
- Link to v1: https://lore.kernel.org/r/20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me

---
Fabio Forni (3):
      mux: convert to use fwnode interface
      mux: Document mux_chip_find_by_fwnode()
      mux: Avoid use-after-free of args.fwnode in mux_get()

 drivers/mux/core.c                    | 134 ++++++++++++++++++++--------------
 drivers/pinctrl/pinctrl-generic-mux.c |   4 +-
 include/linux/mux/consumer.h          |   6 +-
 3 files changed, 86 insertions(+), 58 deletions(-)
---
base-commit: f6e7b42bf05b2427fb8a7a1d1c387a86638bb413
change-id: 20260915-mux_fwnode-a16593c39ffd

Best regards,
-- 
Fabio Forni <development@redaril.me>


