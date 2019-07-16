Return-Path: <SRS0=JkP7=VN=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAF9C76188
	for <linux-gpio@archiver.kernel.org>; Tue, 16 Jul 2019 11:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E1AF2145D
	for <linux-gpio@archiver.kernel.org>; Tue, 16 Jul 2019 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563275396;
	bh=GTNttLKfykU0fMB8TWGXww71EUURBDV6zbj9y9y9CVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nA2c8MAsLWwpOGQs9cSVisyXX26RrlC49ok7ojEaCT7KSlqSNYpZwdbJ0PD8lY0UK
	 mKmykIMTNFYxa9SftM7ZjeqdAWasoWugO/NWClAaubb2cOQy8qrB4sGU+9uwElTcH3
	 HghznoSP+5YNai0+gG1NQZgoBxX6S+RCkZD4lb5g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbfGPLJz (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 16 Jul 2019 07:09:55 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45160 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733200AbfGPLJz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 07:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=GTNttLKfykU0fMB8TWGXww71EUURBDV6zbj9y9y9CVY=; b=Stdaqrb4Nzvjz4Bj7OxsqHHhD
        +Td7CdZOlzO+ek+Wlj1/FC/WJHeQ9gSPUYQBkEz/5sipVYr/hPyWPqlS7cSDQnO+iL3ns21zEDaGi
        3VvzwyAvDJ+Chvj8tqRy5yeKmx6ZrWTp1EMApgzMNqNyFnCUcN19Mpy6CuXjZ4JswoqRQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hnLKz-0004Sl-R4; Tue, 16 Jul 2019 11:09:37 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 9164A2742C01; Tue, 16 Jul 2019 12:09:36 +0100 (BST)
Date:   Tue, 16 Jul 2019 12:09:36 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Ensure child nodes are of type 'object'
Message-ID: <20190716110936.GA5428@sirena.org.uk>
References: <20190715230457.3901-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20190715230457.3901-1-robh@kernel.org>
X-Cookie: May be too intense for some viewers.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2019 at 05:04:57PM -0600, Rob Herring wrote:
> Properties which are child node definitions need to have an explict
> type. Otherwise, a matching (DT) property can silently match when an
> error is desired. Fix this up tree-wide. Once this is fixed, the
> meta-schema will enforce this on any child node definitions.

Acked-by: Mark Brown <broonie@kernel.org>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0tsG0ACgkQJNaLcl1U
h9DgRwf/RVQwM4uJZfc77Bg1QUPRV93uCJ6maAGlUjFImP1U0fpoRuD/zNm5kiIp
hJhe5TMTX5ua+ajO5DV9S4HD4tRJBv5imHYgx7edGX0XnD6uBhO/Fx91okJhKb54
hmWEPpZyjursasR/A6HjQi6+OYEnCqrMoTenaZQZ/R7MlS8Z57C5m8slR9m1tSBp
xam5qvxG3pn5oNarJlCWF9VcVmZckekdU+qutRLVc3xH8bCF6pjfyR5E1M+qRJV6
av5KFLsTopgBECl4QPHGqIXqhegIjWyeqeMC69s7Nh8pDFpLIwFJfXd7x7UGStgS
RrPGZDcB2vfMfsXwQAGfu5lyMqkYJA==
=IEmg
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
