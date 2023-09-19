Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAD5CE79A9
	for <linux-gpio@archiver.kernel.org>; Tue, 19 Sep 2023 19:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbjISTRv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 19 Sep 2023 15:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbjISTRu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 15:17:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67D8E1;
        Tue, 19 Sep 2023 12:17:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E07C433C8;
        Tue, 19 Sep 2023 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695151064;
        bh=ebjAjtM0augVTdmL4SjqfI+x/1ojv/CTauE35eGA8Pg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=chfSUdX4YrcFga2P5HeNsgBGIoP5Mqcv+nEQK/fhk7hO86e0YwFJrrLYPTU1yXYu9
         aQ/cY6fJqckwoMxTZIv0GHf6FhCrIfB2bWYHknQ32FV4FZecSUNaPuLdRutbo6AUbP
         TmQU4oc1u4bmbojONBCy+jZ+3nezy4Gu0YKRNqNUsw+AzYxKPH2d7i7FdjvU4PrUBC
         1gMbTDNXU1vf42R6gbfDolf+jQjI9LQkKtk4JR8zhYPUFD/kuggQe2yXD+NdiaawFU
         O5NFQcQZ3yOgI6FZyHejheJiLXwcidS+cPq/xmGoLYnmWOeaom+90lqvBhWxOK80b3
         nPieriSiDsxsw==
Received: (nullmailer pid 51062 invoked by uid 1000);
        Tue, 19 Sep 2023 19:17:42 -0000
Date:   Tue, 19 Sep 2023 14:17:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tzuyi Chang <tychang@realtek.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 7/7] dt-bindings: pinctrl: realtek: add RTD1619B
 pinctrl binding
Message-ID: <169515106224.50995.5876042785043035967.robh@kernel.org>
References: <20230919101117.4097-1-tychang@realtek.com>
 <20230919101117.4097-8-tychang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919101117.4097-8-tychang@realtek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Tue, 19 Sep 2023 18:11:17 +0800, Tzuyi Chang wrote:
> Add device tree bindings for RTD1619B.
> 
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> v2 to v3 change:
>     1. Use '-pins$' to be node name pattern.
>     2. Remove if/then condition under the patternProperties
>        "-pins$".
> v1 to v2 change:
>     1. Add a description for RTD1619B.
>     2. Rename realtek,pdrive, realtekmndrive and realtek,dcycle.
>     3. Add a description for PMOS and NMOS driving strength.
>     4. Remove the wildcard in the compatible strings.
>     5. Use '-pins$' to be node name pattern.
> ---
>  .../pinctrl/realtek,rtd1619b-pinctrl.yaml     | 186 ++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

