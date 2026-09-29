Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A33AAF73;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715118; cv=none; b=p2fHgyMG3dGrQUF39yqTWvMqcyRQEM/kTzi4nVKL2Z5kKMUCagRTAhPIL40hfVJCW8yuv4dZ/mEfquhoBw1TMMRuGU/a7CAHburOCzuTLoo4h5IlE7pyhGTq9qrQuMFI5tdLTuP91HTxomlbhL6LYe6fi9a2RdDTFwIYCVbgTS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715118; c=relaxed/simple;
	bh=KMNW+x9VcFerLcDU244pVjXcjkMrPrNSJCUy5a6b1Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcFMn86/synlptjVSJcb2tdC3S6CiFi3KiVEEgZKKxh3hyejhF8mt4q+IFhMw11hpvk44idQzhi5NqLhT8rFWdnmqCnXJp7f2rCUrfEuytnUvhCtmo7IiJWTLB6JU9pKVqe7+T2P4Fs70LJi2u8M2xBsU7flDq4E/cIwY1QFM5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ap5yX1hD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ap5yX1hD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41EE2C4AF14;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790715118;
	bh=KMNW+x9VcFerLcDU244pVjXcjkMrPrNSJCUy5a6b1Cw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ap5yX1hDAxl6FVB8d0oabjKL6X/yNxugCsDBhvWTTZ4V8JXAhmCNz3q7rI8RZajjg
	 kYw1keW45fDw9dOYYc3PJxhjIMRlR+CEUA2zen6Iiqi7RXy9WuomMbrvyhJHOxR4e1
	 qweTO10CAD+vQ70s0jEtWJPuoulQLH/Y/CnN864zO8DjFbMrsEesNNaC93bYSqQPBH
	 g7LkqG2s7U7zMhqDMCQD2gw5f78qTLw0LKRX/FJv5YvaBMXT7BnO7VXoildG4Wai1T
	 pYvjLOAud+byt3oG5SRvyx8nmwa8MYf+gnTx5PZey9bwHGu3lAwjqzD6uYrgYhvsLp
	 GKLeqCoagp5Gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248E5CA5FAC;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
From: Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Date: Tue, 29 Sep 2026 22:51:47 +0200
Subject: [PATCH v3 2/3] mux: Document mux_chip_find_by_fwnode()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-mux_fwnode-v3-2-9b3b9ae1334e@redaril.me>
References: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
In-Reply-To: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
To: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 xu.yang_2@nxp.com, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Fabio Forni <development@redaril.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190;
 i=development@redaril.me; h=from:subject:message-id;
 bh=y3Gesa2naAHXthme8UJGKW3y5p3aniZmhazSrn2+quI=;
 b=owGbwMvMwCXWeKho1tqFWemMp9WSGLL2qLzpnLi+lO1bi+DzuZbFfya2HN9S8OHSiZPcPzqmV
 GytW7PCsKOUhUGMi0FWTJHlv5PRpm4zE6Nb/RK1MHNYmUCGMHBxCsBEnMsYGa5dct2ssCJ1Spha
 2b4NbGEyrDfCl553rsu+79ReqnjJ+xwjw7a4O7l3l3ZsnfNLgrf/xy5NkxcyjS03FvoUcf+6EG2
 UzQoA
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
index 56096a9139bd..d5121772c483 100644
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
2.55.0


