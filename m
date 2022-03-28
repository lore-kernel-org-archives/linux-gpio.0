Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8EEC433EF
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Mar 2022 13:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243443AbiC1Nvl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 28 Mar 2022 09:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbiC1Nvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 09:51:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAC72E9D5;
        Mon, 28 Mar 2022 06:49:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 1E9201F42944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1648475398;
        bh=hg3oHnVb2aNV/xfm3ZfDnsU2X0UESM8DZiscH969YFw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=b1hpgtnTbLEuojlhgucjiRgpuCGUCcBscK8sB6vhysmpHx/yRSVWKMNT8uPJi5jck
         gtW0HASATGgqyIoqf3+HohoMt6eTVjcYS8Vrrm6e6mbgoY/qPsf8a+B+rp1GT6CkSC
         lXLdC/+CLoTsWRMTIPmpmXxIQEdZRd2LLxokH6BfMK8mUXfIr15LYPZUZDKCA+8rIE
         bOkwTRYoNzpvMWKa28q68TAaMj/W3JNOin6gxMEeQixOEmYAYxC862PN6QIP1qB4+y
         ja2IgOpipC8DVDIhWGtenATqCID0++s3l9zuJZC8bbqMKgwXa0QiT4qNRXIPHbyq01
         3VGbjpz1//b6w==
Message-ID: <e0264594-7f53-f7b8-349a-e75a0b6706c7@collabora.com>
Date:   Mon, 28 Mar 2022 15:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] pinctrl: mediatek: mt8195: enable driver on mtk platforms
Content-Language: en-US
To:     Fabien Parent <fparent@baylibre.com>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220327160813.2978637-1-fparent@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327160813.2978637-1-fparent@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 27/03/22 18:08, Fabien Parent ha scritto:
> Set the pinctrl driver as built-in by default if
> ARM64 and ARCH_MEDIATEK are enabled.
> 
> Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Since this is boot-critical....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
