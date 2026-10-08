Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992BC3D5253;
	Thu,  8 Oct 2026 20:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490015; cv=none; b=TF6BIxHFP92DTsaZcDWf1FyUN/zKDX1hS8I51MwfUVGyHi5aOuWl90GrrMkWVkLnkhUrQiQKMFfkibimKBLLd7+NQR5hbnwCLSQjBL0+79hnbh2e6GhFYHt+gLuqUv88+GvQoDdM2OZqsSfZhdsssW3/JvBwsT+kToJSPc9CCvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490015; c=relaxed/simple;
	bh=IYapMP+y3ZsxKMdqNwQXhS6WWnTZLOKoL/RQz0KBpm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=INJvfYogiK6XsUXB38cZZ1DBPTnghpuW/ZNQHG8UvPFZYIazYPWMIkns5hdOXiGMxvQxOo6pfNDnD5AhU1LSkFiTB0MU0kvbz5DtL05QzD2/MaRaRiB++y7JzWthKt9E3zoef0tyvIsUFLUSrDdjwnOh8XOh4NIkHpCSzY2zQ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0WqwAUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0WqwAUg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31021C2BCC7;
	Thu,  8 Oct 2026 20:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791490015;
	bh=IYapMP+y3ZsxKMdqNwQXhS6WWnTZLOKoL/RQz0KBpm4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=U0WqwAUgiyW6TCIsMbOdF3it4xyQHde/cTj74tAIY+03lYmMkIXcUAobJjbQTGonj
	 f+bF+4X1D4bcjTurE0SOWE7Y+qAoBgtAgSb6O4bHybJgN4PPzKZ8q5WSoyx5xPa1oD
	 S6OOsyq9R2HzV7wc0FLtzk9RU/LrpIqTmDX8i/bhQG5OXEvOOd/X9x59AY9orAuZP4
	 fhdvcMEl/MptOCndr1QtFe9+9GQQttz+rVF9AyAKr4QtcrQKZfTgnbFLJxrn/intJ4
	 QCMF1eorKuIY5d7zWW5Sbzx9LrghkJU+4Px9n8TWxJVLQwZIVEIR/iJP6Bzacwcy3C
	 VaeFWKA/PLGzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024D6CA6014;
	Thu,  8 Oct 2026 20:06:55 +0000 (UTC)
From: Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Subject: [PATCH v4 0/3] Migrate the multiplexer subsystem to fwnode
Date: Thu, 08 Oct 2026 22:06:52 +0200
Message-Id: <20261008-mux_fwnode-v4-0-ba3330e44b2a@redaril.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MTQ7CIBCG4as0rMUUKKS48h7GGNoZLIn9CSjWN
 L27tKs2uvxm8rwTCegdBnLKJuIxuuD6Lo3ikJG6Md0dqYO0Cc+5yjWTtH2NN/vuekBqmJJa1EJ
 bCySBwaN14xq7XNNuXHj2/rO2I1uufzORUUYRpFFQpj8UZ49gvHscWyRLJ/KtVTvLk5WlZVDKS
 gPgjxUby/XOCppTXYlKG2RCFHs7z/MX/H+f/x0BAAA=
X-Change-ID: 20260915-mux_fwnode-a16593c39ffd
To: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Cameron <jic23@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 xu.yang_2@nxp.com, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Fabio Forni <development@redaril.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114;
 i=development@redaril.me; h=from:subject:message-id;
 bh=IYapMP+y3ZsxKMdqNwQXhS6WWnTZLOKoL/RQz0KBpm4=;
 b=owGbwMvMwCXWeKho1tqFWemMp9WSGLKOf7/TqW4VdWndkl9Srldm1a5zKeGYt3XXrBQGOZsjS
 WwfPO/0dZSyMIhxMciKKbL8dzLa1G1mYnSrX6IWZg4rE8gQBi5OAZhIYxvDb7b1SSJz1rUwbz43
 RcRh+ew19idMT62dP8/QSOO86NvTprEM/0y8TKKvsMbxistvmGSm7H3aX7Zj36+/R8zVDtofn95
 2ghEA
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
Changes in v4:
- The patch that fixes the use-after-free bug is applied before converting
  mux to fwnode, so that it can potentially be backported.
- Link to v3: https://lore.kernel.org/r/20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me

Changes in v3:
- Expand documentation of mux_chip_find_by_fwnode().
- Fix use-after-free bug in mux_get().
- Link to v2: https://lore.kernel.org/r/20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me

Changes in v2:
- Rename devm_mux_state_get_from_swnode into devm_mux_state_get_from_fwnode
- Link to v1: https://lore.kernel.org/r/20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me

---
Fabio Forni (3):
      mux: Avoid use-after-free of args.np in mux_get()
      mux: convert to use fwnode interface
      mux: Document mux_chip_find_by_fwnode()

 drivers/mux/core.c                    | 135 ++++++++++++++++++++--------------
 drivers/pinctrl/pinctrl-generic-mux.c |   4 +-
 include/linux/mux/consumer.h          |   6 +-
 3 files changed, 87 insertions(+), 58 deletions(-)
---
base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
change-id: 20260915-mux_fwnode-a16593c39ffd

Best regards,
-- 
Fabio Forni <development@redaril.me>


