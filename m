From: Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH] kernel/resource.c: fix muxed resource handling in __request_region()
Date: Thu, 10 Sep 2015 00:15:18 +0200
Message-ID: <1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
References: <20150909220140.GD9892@kw.sim.vm.gnt>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:41861 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751055AbbIIWP0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Sep 2015 18:15:26 -0400
In-Reply-To: <20150909220140.GD9892@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alan Cox <alan@linux.intel.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Giel van Schijndel <me@mortis.eu>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Pelletier <plr.vincent@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>

In __request_region, if a conflict with a BUSY and MUXED resource is
detected, then the caller goes to sleep and waits for the resource to
be released. A pointer on the conflicting resource is kept. At wake-up
this pointer is used as a parent to retry to request the region. A first
problem is that this pointer might well be invalid (if for example the
conflicting resource have already been freed). An another problem is
that the next call to __request_region() fails to detect a remaining
conflict. The previously conflicting resource is passed as a parameter
and __request_region() will look for a conflict among the children of
this resource and not at the resource itself. It is likely to succeed
anyway, even if there is still a conflict. Instead, the parent of the
conflicting resource should be passed to __request_region().

As a fix attempt, this patch don't update the parent resource pointer in
the case we have to wait for a muxed region right after.

Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
Tested-by: Vincent Donnefort <vdonnefort@gmail.com>
---
 kernel/resource.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index fed052a1bc9f..b8c84804db6a 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1072,9 +1072,10 @@ struct resource * __request_region(struct resource *parent,
 		if (!conflict)
 			break;
 		if (conflict != parent) {
-			parent = conflict;
-			if (!(conflict->flags & IORESOURCE_BUSY))
+			if (!(conflict->flags & IORESOURCE_BUSY)) {
+				parent = conflict;
 				continue;
+			}
 		}
 		if (conflict->flags & flags & IORESOURCE_MUXED) {
 			add_wait_queue(&muxed_resource_wait, &wait);
-- 
2.1.4

