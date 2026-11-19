Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068576;
	b=kjOTl8aiey4s+rMVfLiSes7kObTMJp7cP1rURUmB4V0jvQE3QBCAk6L64sfg7PWjxBF6
	 Npb+LAoasbZ7MAvH3LtBtfFOpTn0C7fJ9uPaZtRWyBGAXRZMbxaLe4KfKa5Zhf0LpI+Iy
	 DP7QGwtEJG+FXCxXX67XAJzKTgkibVHMTxItv8nyGv5W39vjVsfWV2bGdxAIXctmfYNur
	 o05T3mUfNJh+U+urnL1WWqVDJf/4fgow9e+gT1zcSWla21UzgTSJAhukuXaaEzJRNbfhv
	 I8PsYT9hXN7uK+BSZmCYSKOft5T2Unx+P353gQWmn71wChnJnNUMOugn3518DEiON3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068576;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YB/cyfjwX/52y3Ipa9lzbgUaTU+EJUYgc2Tz4cscnfI=;
	b=zkxI8rInd+TZ3gkvxSDfozEATh4RdIlNnSDhC2EV4hbCbmQAY+dBsnkumVNwYaIwJOTN
	 6ZdFQm8WIRXf/n22JyzkulFdd7OkWFr0zAN6Q/Ahj4cx0gQki+swD/GqAfPoJL+/aVj//
	 1l2zgPCaq1d9Res4sPlFChn/A64SOGKmZp+q6if7ztQ4wM2S8pp1ZRjhpirwlxLmoWFMT
	 2trBsxpCEEW7zSB9Snlu4US0X6OKnRdwoOdbm1WAYeSG92JGIRjJdCtwsC66cFYtTrRlV
	 ZPXDJVRXlhHgFUNDt2YCl/ICJHm6fpfmrZet2p6A2QdWLXML3DkI7hsbSV6YAvadHtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="dQ//ZzV4";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB74606A320;
	Thu, 19 Nov 2026 06:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB74606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dQ//ZzV4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dQ//ZzV4xlquiGr1FA/sWCa+NdL1j41kQvTmi24R1ZHYIxJeAFA/qpC1K66GgKXKIywwXgrFxQZyf
	 Z0MD+EiL7pxehlf3eJu/R8dAhsMsjoTM2gIZD0YkAjSOVZIlstW0juPOBfFtAkHunMeRWvFgDAg0iL
	 dHDIRLnA4zFhZcUs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afe9295a65-e6d15;
	Thu, 19 Nov 2026 14:09:26 +0800 (CST)
X-RM-TRANSID:2ee66afe9295a65-e6d15
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afe9294463-f1e52;
	Thu, 19 Nov 2026 14:09:26 +0800 (CST)
X-RM-TRANSID:2ee16afe9294463-f1e52
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Thu, 19 Nov 2026 14:09:24 +0800
Message-ID: <20261119060924.675-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
References: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
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

Hi Linus,

thanks for taking a look.  For the record, this is about "[PATCH v2]
pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error
paths":

https://lore.kernel.org/all/20261110083253.1525-1-laixiangwu@cmss.chinamobile.com/

On Wed, Nov 18, 2026 at 10:09:40PM +0100, Linus Walleij wrote:
> Fix your email address in .gitconfig please so you don't use
> your login name as name.

Sorry about that.  The email address is unchanged, what was wrong is
that git picked my login handle up as the user name; the .gitconfig
name is set to "Xiangwu Lai" now, and the patch was already resent
with the corrected author and sign-off before your reply arrived - it
is identical to v2 otherwise:

[PATCH v3] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
https://lore.kernel.org/all/20261116031043.502-1-laixiangwu@cmss.chinamobile.com/

On Wed, Nov 18, 2026 at 10:08:09PM +0100, Linus Walleij wrote:
> Looks like a bulky fix, what about just stop using
> of_reset_control_get_exclusive()
> and use devm_reset_control_get_exclusive(&pdev->dev, ..) hmm?

The managed getter is unfortunately not a drop-in replacement here:
the reset phandles live in the per-bank child nodes, while
devm_reset_control_get_exclusive() resolves the "resets" property
from dev_fwnode(&pdev->dev), that is the pinctrl node itself.  The
driver fetches one reset line per GPIO bank from each child:

	bank->rstc = of_reset_control_get_exclusive(np, NULL);

with np = to_of_node(child).  The reset core only provides devm
variants that take a struct device *; there is no devm getter
parameterized by a device_node/fwnode, which is what the per-bank
lookup would need.

If you prefer the managed form, the equivalent that keeps the
child-node lookup would be to register the put as a devm action after
each successful get:

	static void stm32_pctl_put_reset_control(void *data)
	{
		reset_control_put(data);
	}

	bank->rstc = of_reset_control_get_exclusive(np, NULL);
	if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
		...
		return -EPROBE_DEFER;
	}

	ret = devm_add_action_or_reset(dev, stm32_pctl_put_reset_control,
				       bank->rstc);

which turns all the error paths back into plain returns - devres
releases the rstcs acquired so far - and removes the goto
err_put_rstcs wiring from v3.  On success the semantics stay as they
are: the rstcs are held for the lifetime of the device (the driver
has no .remove) and are still in use, stm32_gpiolib_register_bank()
deasserts them.  phy-qcom-qmp-pcie-msm8996.c uses the same
combination for the same reason, a reset phandle living in a
sub-node.

Philipp, does this look sane from the reset core point of view, or
would a devm getter that takes a fwnode be something acceptable in
the core?

I can respin a v4 with the devm action conversion on top of v3, or
keep the explicit unwind of v3 - let me know which form you prefer.

Best regards,
Xiangwu Lai


