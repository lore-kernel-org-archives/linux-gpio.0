Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707945;
	b=dkUAVnXY77GeHHLLH4scX3hROSK44z0uFC3aL8EJ5USduPgbuK6BOVlabeu92l07bHE8
	 LFbv9zgd8JxX2p+JbsCiGuDzln68hcOEjBq8edWa8kJKKppL9FvlIBJdItC1F85LkJgj3
	 gOUULJgiVwoB3pku6wfQmx7VmdR09cSGS/Jv0I4OtVr1SLJmI7dkIifc6m3wbck5v5y1S
	 Tg8aqUtCMRmJ5cGvZjF5YGRV1zOgw2nRqLi0DXxpemNZtWGnUXSDLqAUkep5kYD8IVkrR
	 Lzla3FY9jzOYPVltSec59v+ZfUmFDpbJGrxkA3oQDw3oPiE9wmajm7K36ubdPdBaDOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707945;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=az1KsUCOEvIIxorkitpK+gHntZMH7zgdrhguIEfxT5s=;
	b=x4p2OsNR0Hw5fd8SU/Uf0IAIxb+DHVTVLZ4OA74+iboNHXksmtuCcjrq7Qe56xdn1a+b
	 yNaG7/I/JFz3nriwZKzKtgHRkpXuBbaP5h/rnyfD/zCLiw3Ap/2cyIL78C0nk79ygxS48
	 MtWwXrGhb3eO1XZe46qslFpFM4JgySFXIqYYntx22xJzYUciupICAndjlgF6pCwP7Gpdc
	 ewz3PK6hG3chnN+unvgarGq3qYc3REsNjEZgl/NmSUZCnGyO2vggpdhzx0McFf+cBh281
	 8XdjpdsV+FBWX+mRQX3UC1EMLSnyJ3w7xzQAiGmI6r7AcSsmktgnvPU9hWxKD1MNdCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=ehToWkuS;
	arc=none smtp.remote-ip=185.136.64.228
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61263606A336
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61263606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=ehToWkuS
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261126154536d6aecce887000207b2
        for <linux-gpio@vger.kernel.org>;
        Thu, 26 Nov 2026 16:45:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=az1KsUCOEvIIxorkitpK+gHntZMH7zgdrhguIEfxT5s=;
 b=ehToWkuSkfRSEgmoQnk+U0lHjRGQ14iAp8QUhMva97CGG/LkJQrj6Ng4OYZ68Fw3Vd42Vo
 toBBBOqw06G0VRPy/d0q6rFdfsWxWzGiQSJeJMyq3zab+akS3fTYYQIP/RzRFp1ftBXWk+2L
 ubgpv9wY0MtwsdWCW7gwiPcFzoWNa91SEesv9qTEqqg9C09cyd6XgoWa6hPihZ0J0aHQlpKc
 OHzHa+VPybZ3hf0htwTMjdsy52+35WmtpO5sHqbK5Ye6zdoeS9FWHuexyVZXgSCl8B4U4w1x
 P4U6Re1f0T1kuyeMGwWYGrOaeRpwb0Ne/f2Ty8Nj2WDku5t7FbBYco8Q==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 4/4] pinctrl: single: Drop unused fshift and fmax
Date: Thu, 26 Nov 2026 16:45:25 +0100
Message-ID: <20261126154529.1599568-5-alexander.sverdlin@siemens.com>
In-Reply-To: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
References: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

pcs_probe() derives fshift and fmax from "pinctrl-single,function-mask",
but nothing reads them: fmax was never used and the last user of fshift
went away with commit 2243a87d90b4 ("pinctrl: avoid duplicated calling
enable_pinmux_setting for a pin").

The computation isn't harmless either: a function-mask of 0 passes
__ffs(0) and then shifts the mask by the undefined result.

Remove both fields.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-224208@kernel.org/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2:
- patch introduced

 drivers/pinctrl/pinctrl-single.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index ba5782b6b63d0..9fbc132517c79 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -154,9 +154,7 @@ struct pcs_soc_data {
  * @mutex:	mutex protecting the lists
  * @width:	bits per mux register
  * @fmask:	function register mask
- * @fshift:	function register shift
  * @foff:	value to turn mux off
- * @fmax:	max number of functions in fmask
  * @bits_per_mux: number of bits per mux
  * @bits_per_pin: number of bits per pin
  * @pins:	physical pins on the SoC
@@ -187,9 +185,7 @@ struct pcs_device {
 	struct mutex mutex;
 	unsigned width;
 	unsigned fmask;
-	unsigned fshift;
 	unsigned foff;
-	unsigned fmax;
 	bool bits_per_mux;
 	unsigned bits_per_pin;
 	struct pcs_data pins;
@@ -1843,15 +1839,9 @@ static int pcs_probe(struct platform_device *pdev)
 
 	ret = of_property_read_u32(np, "pinctrl-single,function-mask",
 				   &pcs->fmask);
-	if (!ret) {
-		pcs->fshift = __ffs(pcs->fmask);
-		pcs->fmax = pcs->fmask >> pcs->fshift;
-	} else {
-		/* If mask property doesn't exist, function mux is invalid. */
+	/* If mask property doesn't exist, function mux is invalid. */
+	if (ret)
 		pcs->fmask = 0;
-		pcs->fshift = 0;
-		pcs->fmax = 0;
-	}
 
 	ret = of_property_read_u32(np, "pinctrl-single,function-off",
 					&pcs->foff);
-- 
2.56.1

