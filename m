Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707945;
	b=aeqiyDPD1dMpzT5b+A6lnd0iyCOI5K6RsE9SmsFSXfiChe65AhMQ1h5Twq4J5cbD+Wyk
	 ME7yvFrO5Eg9jn00F9QldzmvnLWUVTqJRC3Pp+HUVNrPTPRzF7nXw6UG3jNxfhsJWuuc/
	 lnyYVPxo5DXz5afVua7GQ3n3MLdzFfGeuUgvRtDOWAplpbDaOyuVeOmkD6pmaxqH7m/e2
	 a47xfx8w7IAkEuyQfP3qU1WZe6MyQh0XYttjNEH0GAql4P9SmGldQuzYQqwKMka0juA4T
	 YKoYuFGDAy7jX5tQX6qnEdZdT++aSkWRAsog4EOgQBl0iwue9FPdm+sMH/Qs5bi8H+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707945;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=Zqe81CUvl0CetbkbGMnAV9O0XTNAJxsTRcckQyPgzXA=;
	b=EwVl4UJlrCMG6JD0IV3zQddbPNu8IlvH1V1pWVgodcHgmqjT8Bvz82nTuwyZA17XCom4
	 K0bHfbUvA8mKWhrwm3S5gm1clJjBxgnPxfE0xkQUcpXjj4zRwf4EP0ucsinWe3RigVtLr
	 xB6PpXpjAvYsVOHdBq93q1h0HW0MQzN1/z9kXHZ8ytICzZ0gGh1uVnEFnlMbjv3B1KQtq
	 +x2DZjmyUJj2xJLhm2cp0uhAIqkVDLMnYK3EjS6mE4GJGd661I/qBNnrckviD0d7QmNxg
	 geAQyf2YUOKEj99QKCi6MKMm4NIWgLbSsh8aq/VnQeGk0vfSq0EyJEDQ79tZ7ElbojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=Kz7GrG4l;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638D5606A33B
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638D5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=Kz7GrG4l
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261126154535bf8d18bcfa000207ac
        for <linux-gpio@vger.kernel.org>;
        Thu, 26 Nov 2026 16:45:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Zqe81CUvl0CetbkbGMnAV9O0XTNAJxsTRcckQyPgzXA=;
 b=Kz7GrG4l+IPMRASsQ52hEw7hdl/YxyNPX4Th5GEcrg2x8Fv/cgTXMICYKDFyFLRyBgSpK+
 eQ+cuaOusrCZt3aNofOMfERfSFO/RxIWqIwA0GjJiur71P0DHt94jN3kWlnBpA/3SeMWKl3r
 WtBPI9cZ50l0MLDP1NOtRIz5DYCw4DLwAjcP3oOBeuvis9fiPkperbsuamDg1tvdJGjJFIDm
 HJJNTVzhqxYQlIadIqoaOpyxV3AvbpQHsGoIdzPn+X/dA73sE4C71qItt0H41WlYR+SGJPrW
 LdU8MRKToj1Op6ZAfFsYeNgQJAb9bogXe9Ro+rFDzA+6CYD15RUR46Pg==;
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
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] pinctrl: single: Also free the pinconf table of a duplicate function
Date: Thu, 26 Nov 2026 16:45:22 +0100
Message-ID: <20261126154529.1599568-2-alexander.sverdlin@siemens.com>
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

pcs_parse_pinconf() attaches a devm-allocated pcs_conf_vals array to the
function pcs_add_function() has just allocated. When a node is mapped
again, e.g. on consumer re-probe, that function is a duplicate of the one
the core keeps and is freed since commit ad2093840ca3 ("pinctrl: single:
don't leak group/function tables on consumer re-probe"), but its conf
array stays on the controller's devres list. It accumulates with every
re-probe of a consumer whose pin group has pinconf properties, until the
controller is unbound.

Free it together with the function.

Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index d72ebb186b894..64472465800c4 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1107,6 +1107,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	if (pinmux_generic_get_function(pcs->pctl, fsel)->data != function) {
 		devm_kfree(pcs->dev, pins);
 		devm_kfree(pcs->dev, vals);
+		devm_kfree(pcs->dev, function->conf);
 		devm_kfree(pcs->dev, function);
 		devm_kfree(pcs->dev, pgnames);
 	}
-- 
2.56.1

