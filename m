Return-Path: <SRS0=g0nt=VA=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A8BC0650E
	for <linux-gpio@archiver.kernel.org>; Wed,  3 Jul 2019 10:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 976D02189E
	for <linux-gpio@archiver.kernel.org>; Wed,  3 Jul 2019 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562151517;
	bh=vcXnr/cvDWOHyNLnrbiSkEVGEsq434DY+9gnA3MNi+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=b12rMHBO1WZ6/4TfDeGvm8ngH6FglaKXK1wG3mr7UtfiEcL7LsjMUgm8OZJZo5KM7
	 lVPkM84sNVyEwdudMQh9P0N+3P0RxBBCP8nN2n9goN6nll8tOd2n3UkCPhi2x1kNs6
	 xP2yjTSQqnsd0NZtpYps6tFB3bPyBpAhTbbSYIB4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGCK6h (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 3 Jul 2019 06:58:37 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45202 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfGCK6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 06:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=PG2bf0edoEcnz2ppC4vPEpg3+2/gMBmBU2MzXxCLKV0=; b=B/FOloOB6LoYAkokWBztUtGHb
        VSXxG5+mZkSFEKPPtZSVZLM4dRcG/jeErI2RS+FkAzd/7O6KqLBYp8yCMgkbacnsoJjMFus8XZEyi
        EDnhkg1uSBt4Ngd6iY0/M74oAiVq+2IwMha81QhzKCybicqCh4Bz634etOdZDxTfNYAn4=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hicyA-0005mt-Ae; Wed, 03 Jul 2019 10:58:34 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id BD761440046; Wed,  3 Jul 2019 11:58:32 +0100 (BST)
Date:   Wed, 3 Jul 2019 11:58:32 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] gpio/spi: Fix spi-gpio regression on active high CS
Message-ID: <20190703105832.GS2793@sirena.org.uk>
References: <20190702193959.11150-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gXx2FYK2AghGE4Yq"
Content-Disposition: inline
In-Reply-To: <20190702193959.11150-1-linus.walleij@linaro.org>
X-Cookie: This sentence no verb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--gXx2FYK2AghGE4Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 02, 2019 at 09:39:59PM +0200, Linus Walleij wrote:

> Mark: I will apply this to the GPIO tree, so I think it is
> safe for you to drop my revert of Andrey's patch once this
> hits mainline. I will try to expediate it, I feel a bit
> responsible.

No worries, thanks for getting to the bottom of this!  Could you
send a revert to me after the merge window if I forget to drop
the patch?  I'll hold off on sending the current fix to Linus for
now.

--gXx2FYK2AghGE4Yq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0cilcACgkQJNaLcl1U
h9A7Iwf/QvG7sh4qhzykROKDwQFEimlunpOneO5qS+x+cqL7y51XcywGLfhZqkCg
qH3kyxZYwDVH6EcZvYyyR1wN5anAlDechz+dxlvWct2DmU30SaJyQtWzPAZL9osm
dg1lZBtF8akZMhzHtnqh+HxMmDYUV+6ekaqpGlq1fH8QrcWUD9FOm7qqy/c6menl
7zYzJ9dk2dl2uxFmD2NwvQsGdi1wbo6dy6I9sQSScJmwNmHvcIZEx9ptHnq93kIu
1SZiB3TxE/XKM8ffHkeKuV7EeOGoapdsh/dxJs9gF4EWbFPqeuZfpcFFplpBX0BF
v4qyXYv5/jfUskS0r0qISRTX13/7AQ==
=ztuG
-----END PGP SIGNATURE-----

--gXx2FYK2AghGE4Yq--
