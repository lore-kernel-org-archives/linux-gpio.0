Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8201C433EF
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Feb 2022 22:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiB1W5V (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 28 Feb 2022 17:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiB1W5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Feb 2022 17:57:21 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD7E120EA6
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 14:56:42 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id p19so23649571ybc.6
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 14:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=neP8Nk08fZpclwsy4oZDHP6Qg38rvK4l+dAouhgd4sY=;
        b=LRyEMX8vXKbt/fERFVTPjB8HYpfUIVskN93/0MXNOpNpXsZ7NBe4+wJhej+G3pztcq
         +xkSc1bZtWoYa4HKxqgX1ueGEGhKttCChS+blldve3KLgNcSGEqrNnewuRugiLKbrGY0
         7I0q5irGNuwCqNil0J/2zEVvEr8CiniiTiWKhB2ugkGQlIz785PCb5lMhRpOBvpbwohn
         QWn5+wZYHw3aCcyGmPbLTMRcNWc0uANZRYoYiciIUDpr7mc+jV903awc/I+ijQnOy3Oq
         4fZGeBCMzCytvp5H/fAvi+/g1LXQlO7D344YeILd3nhOaPedoW5mJloExi3NMlig6m3b
         uXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=neP8Nk08fZpclwsy4oZDHP6Qg38rvK4l+dAouhgd4sY=;
        b=4d17ucqlpgb90SEGtKyO+KnO4bjfekpa2H8JzrefzoN7IW2EGSIkv9n940Ndp9Zvpc
         CQiV9LaLbbmaEPf1ZXqaSVyWfbagpdUASULr8siX9tzzpxZggVY1S68yq5r2kNW+szXy
         +pBcuaMWdfGcGy5t6pTt7ofCC8vIcFPlTATlbqhfR9DRMu320pNLaef655Cc6yKo/c7l
         5SCnhxVuRRWlkzVuNbaT6C0VQ1WwrLJ2LUZPt7y/NarF2lBX9h3jMRFStk7mtzLEyFa6
         ZlNe+Ml48xzxsQHEcpjgIQmBMvb2df41/yq8/P+vZ/qw7iHHYC9phn7EL0Fh7a16DCw5
         b9uw==
X-Gm-Message-State: AOAM530WVLohM1KE5N5L1ji5/FyqUAWXomjl7thqYXat5rOBj+niCZOv
        VwWH/wXz+i7QBvdbArYPYXD8L2Y/wUmBpxQRa/F/Iw==
X-Google-Smtp-Source: ABdhPJzVgTm0+PRy615jIY/6yZdtDIUhPJ1indfObSm8nBBVySwVu1F1U2B/dZz0xuf0VkdPg3wKts+pYKTude9RJQs=
X-Received: by 2002:a25:d74f:0:b0:628:1c15:79be with SMTP id
 o76-20020a25d74f000000b006281c1579bemr9482704ybg.514.1646089001439; Mon, 28
 Feb 2022 14:56:41 -0800 (PST)
MIME-Version: 1.0
References: <YhzC7nLsupHmXOo5@black.fi.intel.com>
In-Reply-To: <YhzC7nLsupHmXOo5@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Feb 2022 23:56:29 +0100
Message-ID: <CACRpkdaRnfVK1Rzc_Sdh9yk+A5bANixamtwmiwJXnAhqQFwvWA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.18-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 28, 2022 at 1:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> New Intel pin control drivers for v5.18-rc1. Cooked a few weeks in Linux Next,
> no merge conflicts observed.

Pulled into my devel branch for v5.18, thanks!

Yours,
Linus Walleij
