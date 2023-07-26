Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193BAC0015E
	for <linux-gpio@archiver.kernel.org>; Wed, 26 Jul 2023 11:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjGZLww (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 26 Jul 2023 07:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbjGZLwv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jul 2023 07:52:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D75F106;
        Wed, 26 Jul 2023 04:52:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D401461AB0;
        Wed, 26 Jul 2023 11:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8370DC433C7;
        Wed, 26 Jul 2023 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690372369;
        bh=8w/nLjkl+nqIUFXUBTIfnkF5EfW/TGFj9s/NoPLragY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=akD/HSYbxVXXEERtZtCqh6Z/ZCB3eEUg4gJ52Y+tPfupgBO5JLY7T/ktCvZYHxcrh
         YxCut95Sw2qrViRyB2tjz6VO2zBND12MnSUxmT/V8k6V+PFo0G8hTw15B+Gdxhqgar
         EHA3bhne6Tl/AeS/Z9Lq85UKEN3DbhEQe4NZdYiM/AI8eqFx9Iq8BHHQVqze8RRvw2
         VMSw2zZEJp2plrtm3Wer8mzHrExsbmR/ygIKKyPYcDHE9RDML8VyCNWIyQ5z2rZmew
         zASthRVAZrRumWdSNy+gco8tjceGYnkHf9wUGDAA+WPtxTuzxWVyBO+653MEtR+3OL
         GWxi33pVTGL5A==
Received: (nullmailer pid 1158235 invoked by uid 1000);
        Wed, 26 Jul 2023 11:52:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     TY Chang <tychang@realtek.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20230726090409.16606-8-tychang@realtek.com>
References: <20230726090409.16606-1-tychang@realtek.com>
 <20230726090409.16606-8-tychang@realtek.com>
Message-Id: <169037236741.1158189.1605537876806523813.robh@kernel.org>
Subject: Re: [PATCH 7/7] dt-bindings: pinctrl: realtek: add RTD1619B
 pinctrl binding
Date:   Wed, 26 Jul 2023 05:52:47 -0600
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed, 26 Jul 2023 17:04:09 +0800, TY Chang wrote:
> Add device tree bindings for RTD1619B.
> 
> Signed-off-by: TY Chang <tychang@realtek.com>
> ---
>  .../pinctrl/realtek,rtd1619b-pinctrl.yaml     | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.example.dtb: /example-0/pinctrl@4e000: failed to match any schema with compatible: ['realtek,rtd16xxb-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230726090409.16606-8-tychang@realtek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

