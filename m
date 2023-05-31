Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB35C77B73
	for <linux-gpio@archiver.kernel.org>; Wed, 31 May 2023 09:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235352AbjEaJh1 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 May 2023 05:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234876AbjEaJhQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 05:37:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B6FC5;
        Wed, 31 May 2023 02:37:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 514D6628ED;
        Wed, 31 May 2023 09:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB03C433EF;
        Wed, 31 May 2023 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685525834;
        bh=4+0MyiKVTQqe8DgyA6IjE/3NWwThW9+rvVXigmsQePk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ipt5YYAygusVm+TOrRMekgsHohVicb1Llis7Had1LpbzpEMNyWbHBaD76dDoCZEva
         +H3vZet/Ha3Se9zGbnHYcXq8XO+duDLE3rQg4d8fkTOq7fdDhDQXMSfckSmCLmA7S1
         Bu4xPZ9p1J6cFm4d3RDTZc1WaxkmThOuqWA6DQLl8A7Q07P0rdGX/8tvbQkDcXEH24
         f6cSVuOHrjBTnqyqJFh4rMtYghc+cc5nlbTse36J215IRoHBFqaR2a5u4LSNvThfo/
         hokhnO3aAy4rwtEj8YOzEj6betxAyYeKDET6IvvOtIo8rrWK+EbLBNwFyNMEP7YC52
         6UwGrOM2VLNEA==
Date:   Wed, 31 May 2023 10:37:10 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20230531-carnival-nanny-6e165f08de0c@spud>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
 <20230530-gag-doorway-e13660d45161@spud>
 <20230531070351.gjh62dssldwworc2@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nDT2JYED1fkBXPVu"
Content-Disposition: inline
In-Reply-To: <20230531070351.gjh62dssldwworc2@pengutronix.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--nDT2JYED1fkBXPVu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 09:03:51AM +0200, Uwe Kleine-K=F6nig wrote:

> > Rob did note that gpio-hog.yaml in dt-schema would need to be updated,
>=20
> This is a followup-change in a separate repository once the change
> under discussion is in mainline, right?

Yeah, https://github.com/devicetree-org/dt-schema

Cheers,
Conor.


--nDT2JYED1fkBXPVu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHcVRQAKCRB4tDGHoIJi
0jT1AP9ZWzRZTeCeIHkwalKFsJd4dVWWekJav44OlnY2AZFenQD+JNg/H65tmxgS
2xY4eV78w8raEN218JLz5l4Kv88WXAs=
=HUPP
-----END PGP SIGNATURE-----

--nDT2JYED1fkBXPVu--
