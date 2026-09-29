Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7813D3AFD18;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715118; cv=none; b=ILHoELzfvQDhb0E0lIW0hd2m5h7gfl+f4wcnNupBQVfG2mQ1T9Hl4f7LQLj8LIdEAro0Sildg75RBVcHvqO1c2EsAkcoO61bkAFe9n82WvM6or5xPtiXaa0/pQTA9wiXi4yX5IwbQ4EkK+EXWUGMp8l9ekN+hqqmBbLiQAfV4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715118; c=relaxed/simple;
	bh=Po8Iu8ke9WuoNZA0H28y5N7b4qHGP69FGvXHpdPUr5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AD74Vyr2mBYjnuSYlD9+uBVLOINZgerGRZf/ciFOt7amOC1oolWoSpZOLVaqApcrW0pC+jF7i8PTETl/HRz4xqhHZP2bRkbb8TYlx+5Z9jv3zCPEImQM3FOGqsqj2pcmXukO+sGa/lVLgmy61VFY8SsKqwT5uB+ug2kh9J9R2bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3vaxc04; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3vaxc04"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48751C4AF15;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790715118;
	bh=Po8Iu8ke9WuoNZA0H28y5N7b4qHGP69FGvXHpdPUr5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U3vaxc04JXfFtYOzlZ1cRcekrT/N9wZ7XfzPSrunM6FLgnilDAwIN0t9JNw3u8M+P
	 nsNSuRaRvAJPX4nupOsV3JPZoVjZmA11Vk3aBdcyXTS2MIBRL/Xbyo7lC8RPX+Vr7E
	 gAiO7TQ5O8W77aMfl4BKpG9mw8z491HJYH9+nExb/8lh0yBP7sdnEDn7qjmmi+1Eq4
	 zI94hVRd1OkzHzAjwRHZvP6sjaXoY95nshBAeqST5+sFvu/YRqOWjU8I8WGLxCvW/B
	 lMoirBbq2tA9ZzvdHZU8Se22ihrKQIICUOQJVf8e4OYadnoXt7gFQ03e5Z/Hy31Q30
	 XY2s1Af21Np+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312D4CA5FB3;
	Tue, 29 Sep 2026 20:51:58 +0000 (UTC)
From: Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Date: Tue, 29 Sep 2026 22:51:48 +0200
Subject: [PATCH v3 3/3] mux: Avoid use-after-free of args.fwnode in
 mux_get()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-mux_fwnode-v3-3-9b3b9ae1334e@redaril.me>
References: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
In-Reply-To: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
To: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 xu.yang_2@nxp.com, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Fabio Forni <development@redaril.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2785;
 i=development@redaril.me; h=from:subject:message-id;
 bh=e0+O4F+HF3uayRpoSd/VVnjt9CLFt59iD9UZlQ8qXHY=;
 b=owGbwMvMwCXWeKho1tqFWemMp9WSGLL2qLxZsfDG1lcLwz1W5IVfbumxdMll5NAvrThvXcj0Y
 QbH4RttHaUsDGJcDLJiiiz/nYw2dZuZGN3ql6iFmcPKBDKEgYtTACYiWc7wPzxXeNcJZYc169IX
 f3z//tPf1I1NjO5vwrUYPhUtbfVbVMjIcG5WA+d/uas6Z2fcWV+pYdf+nGVi9a7UdXPDnYo6VLT
 N+QA=
X-Developer-Key: i=development@redaril.me; a=openpgp;
 fpr=FF4232B28B363432DA8F187D81C2729AADA16A67
X-Endpoint-Received: by B4 Relay for development@redaril.me/default with
 auth_id=1033
X-Original-From: Fabio Forni <development@redaril.me>
Reply-To: development@redaril.me

From: Fabio Forni <development@redaril.me>

fwnode_handle_put(args.fwnode) was called right after
mux_chip_find_by_fwnode(), but it was too early because the error
handling code below would pass args.fwnode to dev_err().
Let's move all freeing functions to the bottom of mux_get() to avoid
use-after-free bugs.

Signed-off-by: Fabio Forni <development@redaril.me>
---
 drivers/mux/core.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index d5121772c483..8bf8c79bc634 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -545,6 +545,9 @@ static struct mux_chip *mux_chip_find_by_fwnode(struct fwnode_handle *fwnode)
  * @optional: Whether to return NULL and silence errors when mux doesn't exist.
  * @node: the device nodes, use dev's fwnode if it is NULL.
  *
+ * When a mux-control is found, it is the caller's responsibility to call
+ * mux_control_put() on it when it is no longer needed.
+ *
  * Return: Pointer to the mux-control on success, an ERR_PTR with a negative
  * errno on error, or NULL if optional is true and mux doesn't exist.
  */
@@ -597,9 +600,10 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 	}
 
 	mux_chip = mux_chip_find_by_fwnode(args.fwnode);
-	fwnode_handle_put(args.fwnode);
-	if (!mux_chip)
-		return ERR_PTR(-EPROBE_DEFER);
+	if (!mux_chip) {
+		ret = -EPROBE_DEFER;
+		goto end;
+	}
 
 	controller = 0;
 	if (state) {
@@ -607,8 +611,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 		    (args.nargs < 2 && mux_chip->controllers > 1)) {
 			dev_err(dev, "%pfw: wrong #mux-state-cells for %pfw\n",
 				fwnode, args.fwnode);
-			put_device(&mux_chip->dev);
-			return ERR_PTR(-EINVAL);
+			ret = -EINVAL;
+			goto end;
 		}
 
 		if (args.nargs == 2) {
@@ -623,8 +627,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 		    (!args.nargs && mux_chip->controllers > 1)) {
 			dev_err(dev, "%pfw: wrong #mux-control-cells for %pfw\n",
 				fwnode, args.fwnode);
-			put_device(&mux_chip->dev);
-			return ERR_PTR(-EINVAL);
+			ret = -EINVAL;
+			goto end;
 		}
 
 		if (args.nargs)
@@ -634,10 +638,17 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 	if (controller >= mux_chip->controllers) {
 		dev_err(dev, "%pfw: bad mux controller %u specified in %pfw\n",
 			fwnode, controller, args.fwnode);
-		put_device(&mux_chip->dev);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto end;
 	}
 
+end:
+	fwnode_handle_put(args.fwnode);
+	if (ret < 0) {
+		if (mux_chip)
+			put_device(&mux_chip->dev);
+		return ERR_PTR(ret);
+	}
 	return &mux_chip->mux[controller];
 }
 

-- 
2.55.0


