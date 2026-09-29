Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CACE3DB320;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721715; cv=none; b=sS3QuMAF4j1JFhrlefITqAcANxNeUoT1RXCNN4R7zF0g4tfohnX+n41WZbEXBMFHlJypcrZdm17zqlU+LpBwqKjiuRUySUBHbmFansDRBck097jUHPDDWmcj8LriM0vkycFyZvKTcXUHqR6niXkjwHvllyGXWwgYzKGEQboiacE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721715; c=relaxed/simple;
	bh=0T3gCO8tWZxos4GP1TYHCuCatUIYaQOBRijsytZ3s1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoQUrXM3dVn8id7oeZnp20frCzGtDK0JAbTtGwR4hQGM4cgBBTc1leKiAJzEu4iMH/HE3cjFtbxlSKAxRxXugPnAPR1JdZRsj8SbyFFPG3BaUNIpPRoRubcBJkYksdeiZKqWUr3JzG4GVPDL8Dt7Rn7f5MJaJGSt4fddGfTv+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qh7dnXpV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qh7dnXpV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBF9BC4AF0B;
	Tue, 29 Sep 2026 22:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721715;
	bh=0T3gCO8tWZxos4GP1TYHCuCatUIYaQOBRijsytZ3s1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qh7dnXpV+z3a+gVdgBnW/l1YHWFRjGqmPfOhRmXBgU5K29gJqFcmYana6ot07tKmh
	 /We+uyi4cMAqvfONiwhq8iABpkYcrn1maSSM837udnjoI6YfYDuX1ek17AdT0jgPyC
	 cu8AfX7BYeEClYqVj0hxq59Ms01ZssmAqzfYk/V27+fSa5iCAdNBvjzuxPYeBxBJdV
	 fMTyqwd3Rb7FtVFUcihC04jwY4mxhOxUOmpjcSYXu4jpA4g779zu9O1jN6H5kHy3ki
	 VWnvwY9v+OLKgEBtPXGu6CfbzA4Lnn6WHUi0xzlmptb757fG93krk4GlNMxkwn731o
	 4gQvwRU7aL3qA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9039CA5FA5;
	Tue, 29 Sep 2026 22:41:54 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:35 +0300
Subject: [PATCH v18 01/23] media: mc: Add INTERNAL pad flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-gmsl2-3_serdes-v18-1-43117818f499@analog.com>
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
 Andrian Suciu <Adrian.Suciu@analog.com>, Martin Hecht <mhecht73@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=4257;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=AjWI5epk+kN0BnyzM5CLFxA3YXSEUO2r8K59QBAwlF0=;
 b=f06A+2YjGjtRyyg0V428C1PlouL2v28b5oEwXfqJMArBMxTGsi9A4JgpYA8JhZ2OG/Udm2smd
 hHEMJ7/2VWpAx7H/YbLBrsGmbpwMlhjf9pkOI4apmxvKrMGzGgiO8kB
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Internal sink pads will be used as routing endpoints in V4L2 [GS]_ROUTING
IOCTLs, to indicate that the stream begins in the entity. Internal sink
pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Martin Hecht <mhecht73@gmail.com>
---
 .../userspace-api/media/mediactl/media-types.rst          |  9 +++++++++
 drivers/media/mc/mc-entity.c                              | 15 ++++++++++++---
 include/uapi/linux/media.h                                |  1 +
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..200c37a1da26 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,14 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. As they are internal to entities, internal pads shall not
+	  be connected with links.
+
+	  The internal flag may currently be present only in a sink pad where it
+	  indicates that the :ref:``stream <media-glossary-stream>`` originates
+	  from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 3fa0bc687851..7938f785e2e3 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -209,11 +209,16 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		mutex_lock(&mdev->graph_mutex);
 
 	media_entity_for_each_pad(entity, iter) {
+		const u32 pad_flags = iter->flags & (MEDIA_PAD_FL_SINK |
+						     MEDIA_PAD_FL_SOURCE |
+						     MEDIA_PAD_FL_INTERNAL);
+
 		iter->entity = entity;
 		iter->index = i++;
 
-		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+		if (pad_flags != MEDIA_PAD_FL_SINK &&
+		    pad_flags != (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL) &&
+		    pad_flags != MEDIA_PAD_FL_SOURCE) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1118,7 +1123,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1148,6 +1154,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..80cfd12a43fc 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */

-- 
2.53.0


