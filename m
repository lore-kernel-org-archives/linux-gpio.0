Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145EA1F1932;
	Sun,  1 Mar 2026 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772383616; cv=none; b=DM4fVKFPTRk/B5K7IxAPD/ds7+PGWNH12cbetU7vuttn7KIvly9MySE3QWQZQuRcWNmDyZYLvnL0RVqr00JewQla3OynxY3GsIaV7wlKUpyq/6ugpF3pcruMNWRxG98YrMjx2uGXh9QHOTaWGoqQhRDqjWQWgzRb86Dkpem0zGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772383616; c=relaxed/simple;
	bh=qsbCEDLgAC513AjtmknCrNPOfk9MWTiWgh9/aIl5RD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gJRm/mpIpG7JUzRwrvmdZzGU5q4GmfkNXLIA+o1qG9nckBH3mvZphPe4faSbRwnq0cPuQ4hNPBwm/0o4A87uGIU7wfaHEGxd7FfBIsQxCSkAd9SRxkkypxbDCcoTucj/CtxMfSa3r2KclxLMAuHghxQWwwzpBmQomqa6T27gt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=nTXqggsk; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="nTXqggsk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dFpyuUi08ipfETxMTzbuKYKiIg5L8MRQA8qtmO2cGZY=; b=nTXqggskY2lifr4KMh/ededtc3
	pPOpyjDWtJL2Cy4yUczza7GQxN2PB/DyXg8sLnDgdPp8txZRwn8fPsZSAMTNJ2aIx7XnwW8/YOdv5
	AbhsnocIBKvEsuk5QXJ48uhookKdPTdWOdqYx1xgXs8V/dbKqHNLXUvCw5r9aKrWNrlNZMIoK5wy0
	Te3kXifN+kjHndNdAXPMN4KL7szFpQBzav944XZ9r1plUCa761yyO9vHpzL42Wai01CVB8vg8Wdvz
	v/ywHuLGl9X7uDG82a1ly3L/l53/WrnIlpJT2Vsj8LIYWALnuBN48U/jjLZrcDEgDJ3t1zTU2e8Ux
	xTI5/k5g==;
Received: from user-5-173-212-70.play-internet.pl ([5.173.212.70] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vwjwR-00000005Jvn-2gmF;
	Sun, 01 Mar 2026 17:46:51 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 01 Mar 2026 17:46:31 +0100
Subject: [PATCH] pinctrl: core: use dev_err_probe() when applying state
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-pinctrl-dev-err-probe-v1-1-94a0a2cecc6c@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAGZtpGkC/x2MQQqAMAzAviI9W+gUZPgV8TC3TgsyRyciiH93e
 AwkeaCwChcYmweULylypAqmbcBvLq2MEipDR91APRnMkvypOwa+kFUx67EwEgVL0VbLDVDbrBz
 l/r/T/L4fXTXN1mcAAAA=
X-Change-ID: 20260301-pinctrl-dev-err-probe-00d80f8202a6
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772383594; l=1805;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=qsbCEDLgAC513AjtmknCrNPOfk9MWTiWgh9/aIl5RD0=;
 b=TSuK0fm8kSJHEw1pjbYWDzdRDqPBTVnfAJcx3mVOLUOnqVpM9P4AbxrUs2p0Ewmy3e+92RWw5
 0pE20kfOD8jCNYkxG7/RrqW4IAXt2XOg88sfglN8fr2+QUIy/SUoJgb
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

When applying a pinctrl state, -EPROBE_DEFER may be returned if
dependencies are not ready and the consumer will retry probing.

This is normal probe ordering behaviour and not a real error.
However, pinctrl core currently logs:

  "Error applying setting, reverse things back"

even when the return value is -EPROBE_DEFER, resulting in noisy
boot-time error messages.

Replace dev_err() with dev_err_probe() to handle -EPROBE_DEFER
consistently and suppress error logging for deferred probes.

No functional change intended.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
This series contains a single patch to suppress spurious
boot-time error messages when applying pinctrl states during
normal probe deferral.

Currently, pinctrl core logs an error even when
-EPROBE_DEFER is returned, which is expected probe-ordering
behaviour.

Switch to dev_err_probe() so deferred probes do not emit
misleading error logs.

No functional change intended.
---
 drivers/pinctrl/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b5e97689589f..2edc9bdad183 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1350,7 +1350,8 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 	goto restore_old_state;
 
 unapply_new_state:
-	dev_err(p->dev, "Error applying setting, reverse things back\n");
+	dev_err_probe(p->dev, ret,
+		      "Error applying setting, reverse things back\n");
 
 	/*
 	 * All we can do here is pinmux_disable_setting.

---
base-commit: eb71ab2bf72260054677e348498ba995a057c463
change-id: 20260301-pinctrl-dev-err-probe-00d80f8202a6

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>

