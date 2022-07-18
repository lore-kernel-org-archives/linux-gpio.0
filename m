Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9C7C433EF
	for <linux-gpio@archiver.kernel.org>; Mon, 18 Jul 2022 09:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbiGRJ11 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 18 Jul 2022 05:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233663AbiGRJ11 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:27:27 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32A319C11
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:27:25 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ez10so20052590ejc.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+icv+IJ1TJ8/3xu2M4sP7/7AeCsZ4gFWLPwS5u9SNFg=;
        b=agRDU6yWNC6T3uQoKsXpznz1Nlk4E3NowXCVh5Op296iiyVx9blby60QuJ42Nh8nGJ
         23rlSGHxc2W2PI/uZQGe4hex0YLlie2DBijssE75xA67XCP59AOl0IWMf0JJse8KtbAn
         yjrwOUftMzLC4TAXDzV1JUNGEvxK7pZPPZp5F4UIO/MA2N6ugLyx+gdb1bbDCDVvOz9O
         n2FaZm4mUbuet201w1dpS00dzTpJLSqh6BbIngIAyrowzsCKOsU+pF2XucMpHq7wf9p0
         nVXMwkcMN7uzxLKEB34PGkDsRJX7uMnhIR4HBDUBzqgt4rswVc55NvgQGLF+0CY8I/9m
         yEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+icv+IJ1TJ8/3xu2M4sP7/7AeCsZ4gFWLPwS5u9SNFg=;
        b=7cZ+5V8qJ/WmRbV3XwYbYg4HsWI5V5ICsPhdRyxrrVHyOqtcAgVahTuGWJgdZt5mje
         XHaupSVDAfWxiw1s9DDoRV+GgILAJFG5yKysEbUjUGv4+qzba94LQduLWAmq0/rnQFnl
         WwW8VUZ12sCfHob+8OACPeWV4/iWO/0BSONigU0VBbLjZFUw0Z7dHa/2Q8eEDwOZMj2k
         guUSx5L7zd/UoKxplcB42jFvMoVRGm/vZ9bOM9xZYou6heFNsWPQ+F56xLB7v03H80vx
         PuvNSQPZoFqbqPPT4zpMIqZnI80567+NQE89FwZ4SVQu6U9y8SezxVWxfOiJI66H1ehR
         ljKQ==
X-Gm-Message-State: AJIora+U+MsBieSg4nJhf91DRIhPy+b1ODKWG2Vll70YLLXUKkqG5/dQ
        oFW/Gl+mC+M5Hnz+rXzdaZeYjud8ZoUtSslDcVJmIA==
X-Google-Smtp-Source: AGRyM1v9fKqHGAElZYf1oxl9ZazBcWXcPQYo3vM7TuEExHTjtodpQSuuSmWiB9RLuNbqmAQ/SAwEJa2Rnxa/BDvJ3cY=
X-Received: by 2002:a17:907:9612:b0:72e:56bd:2b9a with SMTP id
 gb18-20020a170907961200b0072e56bd2b9amr21685288ejc.526.1658136444582; Mon, 18
 Jul 2022 02:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220713013721.68879-1-warthog618@gmail.com> <20220713013721.68879-2-warthog618@gmail.com>
In-Reply-To: <20220713013721.68879-2-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:27:13 +0200
Message-ID: <CACRpkdaO9VWH4nsxseY9==wUVb6M+q+AVKEd951GJ_KGV_FJVA@mail.gmail.com>
Subject: Re: [PATCH 1/6] gpiolib: cdev: simplify linereq_free
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, dipenp@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 13, 2022 at 3:37 AM Kent Gibson <warthog618@gmail.com> wrote:

> The edge detector is only ever started after the line desc has been
> determined, so move edge_detector_stop() inside the line desc check,
> and merge the two checked regions into one.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
