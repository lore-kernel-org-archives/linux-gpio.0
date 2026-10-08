Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A047D3D6664;
	Thu,  8 Oct 2026 20:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490015; cv=none; b=fAgxPNZ3rZhh/glvd8qhXIVjPPdEBm61mnkJuHTm4JMxfe7hGm7u4vwpHrSrdH7MLSaDn6n+ZWa038djFRoyq0yf2DWGv66vFsyc1OKvGlkzNB+iwahCO5tuRNiEFplOzisM4SpXI6QYvbW/FlKRIhO/etyZqoJGfd3VX41pgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490015; c=relaxed/simple;
	bh=xbltcxAxuVaJno7acnWG2nJ0qLysAci22oK7Lfr0rWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTiveN++6i8y0c11pD+ljZ9/O9uFqAcjc2zPF6u2jrfjtSbTrgKsvCYzrXWPsFuKjaHJDy1So+9BvIrjuVgNjV9M72AsrycL0yE99Zdp2klGEwUW6H8I8ua5GzL4WoWXt+PG65sa6lP8faABJb7xLwc+Ecea5I4mOCZz8M9Waas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3M8ad2r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3M8ad2r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F3F2C2BD00;
	Thu,  8 Oct 2026 20:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791490015;
	bh=xbltcxAxuVaJno7acnWG2nJ0qLysAci22oK7Lfr0rWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c3M8ad2rj5NxeeDUwkNHoKx1NZkP4wjQ5jNh1pMfCtS4P7q0K5hdEBvAElRlwxuBA
	 Uz6MaZofQaRERsjYqYeYtaTDtnE/+n/kUx3nPBciFNPR88/kcKtSm/h9tWoSgd87/z
	 3zUZ8cXFwA5Xgrr7iQj6SPJ1wiXHtD04ED22ch1AgM3iLW/O3na2et3MYoeA9O+hNm
	 cru+9CN4vy4pWO1k3cq5r9cJUKYnROibnn8yPNDPn53mBCsUa/caDmtmLZK5ZsUJCc
	 5myrgy4QyFmA835ws3vCJ4t+LBqwc48EHpWXNAHjHHX7OBous/C19YZb8ZtS9ofuXm
	 iTX3S7aDte2oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C1BCA600C;
	Thu,  8 Oct 2026 20:06:55 +0000 (UTC)
From: Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Date: Thu, 08 Oct 2026 22:06:55 +0200
Subject: [PATCH v4 3/3] mux: Document mux_chip_find_by_fwnode()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mux_fwnode-v4-3-ba3330e44b2a@redaril.me>
References: <20261008-mux_fwnode-v4-0-ba3330e44b2a@redaril.me>
In-Reply-To: <20261008-mux_fwnode-v4-0-ba3330e44b2a@redaril.me>
To: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Cameron <jic23@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 xu.yang_2@nxp.com, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Fabio Forni <development@redaril.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190;
 i=development@redaril.me; h=from:subject:message-id;
 bh=3ugiR2GUQE3TNuEoICgiX48ZBvSu79H9cYGwRJkp4mE=;
 b=owGbwMvMwCXWeKho1tqFWemMp9WSGLKOf79rJm5mX6kqIz9zSmTzF8bM1Xa39q5ZEv3OoE3Wo
 /BrK0dyRykLgxgXg6yYIst/J6NN3WYmRrf6JWph5rAygQxh4OIUgIk4TmZkuLTUyb/3fdaDtqim
 Q/r3U5uVZfZuSHg+e999h0R3tfX6aowMfbEqxmY7GR5d/J8bdGNhxFoO07/MhlHflR0Dkjqb1Pb
 xAAA=
X-Developer-Key: i=development@redaril.me; a=openpgp;
 fpr=FF4232B28B363432DA8F187D81C2729AADA16A67
X-Endpoint-Received: by B4 Relay for development@redaril.me/default with
 auth_id=1033
X-Original-From: Fabio Forni <development@redaril.me>
Reply-To: development@redaril.me

From: Fabio Forni <development@redaril.me>

What mux_chip_find_by_fwnode() does it pretty obvious. What's
not-so-obvious is that the reference count of mux_chip->dev must be
decreased when done working with it. This commit clarifies the
requirement.

Signed-off-by: Fabio Forni <development@redaril.me>
---
 drivers/mux/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index d5095905b02e..6289cc98f49e 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -517,7 +517,16 @@ int mux_state_deselect(struct mux_state *mstate)
 }
 EXPORT_SYMBOL_GPL(mux_state_deselect);
 
-/* Note this function returns a reference to the mux_chip dev. */
+/**
+ * mux_chip_find_by_fwnode() - Find a mux-chip by its fwnode.
+ * @fwnode: The fwnode representing the mux-chip.
+ *
+ * When a mux-chip is found, the mux-chip increases the reference count of
+ * the underlying &struct device. The caller is responsible for calling
+ * put_device() on it.
+ *
+ * Return: Pointer to the mux-chip, or NULL if not found.
+ */
 static struct mux_chip *mux_chip_find_by_fwnode(struct fwnode_handle *fwnode)
 {
 	struct device *dev;

-- 
2.56.0


