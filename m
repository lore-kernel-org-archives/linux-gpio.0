Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37084E4320;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721715; cv=none; b=Zjq0SZ9nW26GFFWejIeIcHuSXtpaE67/yKgg7UyOaD38rHcgHZfzXtC9qBIUxlUt6/RInwU9D5zvuMssFDvurW9UTdv9PuT9n8sCCZs2u8BiWXEfv7+aeOHIBSNBYFv4Uqv/NtGTPzhf3KcZoqmTycrjhrXmfWd/snO8+oV6h6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721715; c=relaxed/simple;
	bh=9RKZraDwM9H1ZhvKjKzDRZ+HYrQ9YCXpHoPHv6I9kCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRyzp9mBZFmUsQvUQUxSm1N0mW8o8x9YpaUuCuQup1w2dUUBzpYxfadEg56vZKwjkN86YIInfCo5ZkRNyhACtKYn19jupX4AQrijei9YkJjs1XJV1l0Q3fKZzi+rkCvKn3AZSZUXaxjhaRmwQiKCKhFSQb7v9KAtgHOKzf226VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dmsq15UK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dmsq15UK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A88E1C4AF16;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721715;
	bh=9RKZraDwM9H1ZhvKjKzDRZ+HYrQ9YCXpHoPHv6I9kCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Dmsq15UKOwz5VTLiiMxjTGZOxnG7pdB7OKAfyRRb5D2sDaUxM/w+d0WEcAe/cKJDQ
	 GrXdV6X6mPQVQe9B6jMmGE2/VqbAL4caUBmGuGRlqV3cKOSSw1w98XaVUOqrt7li8S
	 +TUwVk1k+e5JKZJWS7JybYrBA3HfT2zmJHz0FHXiK8dO1dqkM2V1FghAj4sXZVfLcm
	 IqumifB3WyaRzlUKetp1GDBREHU2oySCgMjL0+iJIDVW/EoE25hHT87M76QwhJqtfk
	 LO5X1YoiioO3SGDC2OAZzcaAU6r16+7tVn4ZEjat66MbogXCSLJQbv0GzQFYRiT5Rx
	 F9ThxOC0B4lxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954DBCA5FA7;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:47 +0300
Subject: [PATCH v18 13/23] i2c: atr: serialize attach/detach against bus
 transfers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-gmsl2-3_serdes-v18-13-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
In-Reply-To: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>, mitrutzceclan@gmail.com, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Martin Hecht <Martin.Hecht@avnet.eu>, 
 Andrian Suciu <Adrian.Suciu@analog.com>, 
 Quentin Freimanis <quentin@q-lab.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=2334;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=BzonsaTzVGAWmnVOwQz2Jf0/RUn4KnlpIxawiVR7AoQ=;
 b=C1QBwqxybTM1bxDc6LTnDuQ6m4r/vV+1XwFcu/LR5JqndWRjINmw91+AV1cAZgXXJ6GxuITu6
 tePWjxjqyQtDrZeNBKwvSfyp24EzM6DcrjmDZnpufhX4RHIeHzG13Bj
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Dumitru Ceclan <dumitru.ceclan@analog.com>

The attach_addr() and detach_addr() callbacks may need to reconfigure
the remote side of the bus. Maxim GMSL deserializers, for example,
disable all links but one to reach a serializer at its default address,
since all serializers power up at the same address.

Transfers on other channels of the same ATR can run concurrently with
these callbacks and fail with -EIO while the links are disabled.

Take the ATR bus lock around both callbacks, before alias_pairs_lock.
i2c_atr_replace_mapping_by_addr() already calls them under this lock,
so ATR drivers see no new constraint.

Suggested-by: Quentin Freimanis <quentin@q-lab.dev>
Signed-off-by: Dumitru Ceclan <dumitru.ceclan@analog.com>
---
 drivers/i2c/i2c-atr.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index ca29633dcd62..b98442ffff94 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -540,6 +540,12 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	struct i2c_atr_alias_pair *c2a;
 	int ret = 0;
 
+	/*
+	 * attach_addr() may reconfigure the remote side of the bus, keep
+	 * transfers on other channels out until it is done.
+	 */
+	mutex_lock(&atr->lock);
+
 	mutex_lock(&chan->alias_pairs_lock);
 
 	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
@@ -557,6 +563,8 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 
 out_unlock:
 	mutex_unlock(&chan->alias_pairs_lock);
+	mutex_unlock(&atr->lock);
+
 	return ret;
 }
 
@@ -567,6 +575,8 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
 
+	mutex_lock(&atr->lock);
+
 	atr->ops->detach_addr(atr, chan->chan_id, addr);
 
 	mutex_lock(&chan->alias_pairs_lock);
@@ -574,6 +584,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (!c2a) {
 		mutex_unlock(&chan->alias_pairs_lock);
+		mutex_unlock(&atr->lock);
 		return;
 	}
 
@@ -586,6 +597,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 	i2c_atr_destroy_c2a(&c2a);
 
 	mutex_unlock(&chan->alias_pairs_lock);
+	mutex_unlock(&atr->lock);
 }
 
 static int i2c_atr_bus_notifier_call(struct notifier_block *nb,

-- 
2.53.0


