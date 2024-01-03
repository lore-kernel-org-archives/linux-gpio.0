Received: from wormhole.robuust.nl (leaseweb-ip1.robuust.nl [178.162.147.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D641CA94
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensourcepartners.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wormhole.robuust.nl
Received: from costar (helo=localhost)
	by wormhole.robuust.nl with local-esmtp (Exim 3.36 #1 (Debian))
	id 1rL6l1-0000HY-00
	for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 20:18:27 +0100
Date: Wed, 3 Jan 2024 20:18:27 +0100 (CET)
From: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
X-X-Sender: costar@wormhole.robuust.nl
To: linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH v2 retry] core: fix deselection of output direction
 when edge detection is selected
Message-ID: <Pine.LNX.4.64.2401032017390.31157@wormhole.robuust.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII

Fix deselection of output direction when edge detection is selected in
make_kernel_flags(). Use correct flag to perform deselection rather than
a library enum.

For correct usage, there are no visible side-effects. The wrongly reset
kernel flags are always zero already.

For incorrect usage of edge detection combined with output direction,
both output and input directions would have been requested from the
kernel, causing a confusing error. Such usage will now be sanitized, as
intended, into a working configuration with only input direction.

Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
---
 lib/line-config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/line-config.c b/lib/line-config.c
index 2749a2a..9bf7734 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 	case GPIOD_LINE_EDGE_FALLING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
+		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_RISING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
+		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_BOTH:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			  GPIO_V2_LINE_FLAG_EDGE_RISING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
+		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
 		break;
 	default:
 		break;
-- 
2.30.2

