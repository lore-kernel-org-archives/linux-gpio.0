Return-Path: <SRS0=FFhp=EK=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DFCC2D0A3
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Nov 2020 20:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEA3620782
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Nov 2020 20:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXB4kSQJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgKDUho (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 4 Nov 2020 15:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgKDUho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 15:37:44 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BFCC0613D3;
        Wed,  4 Nov 2020 12:37:44 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id f38so17573762pgm.2;
        Wed, 04 Nov 2020 12:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KqtmvIeCcEE4/0N0FwB4Be0GcMo80VuNERTsRMZmWY8=;
        b=aXB4kSQJm7gg6cFUbtrYSByfJtj3mF5nBA64oUXvY9DLFZl1xDz1N2hbVH2umtgz+2
         qZFe7/49PRzpHpMPcKtTsey77QZ6CJgnUyu49LUfyKtBg8NYJ+BqJu/ofvr/LH3oDduf
         JBo1WfRa87+KTUaOjP0MCZauRUV+vgjg0yWqbTzlWPcrReQcZ/NbbT5loNuE9kdYGomB
         aFNjzIE5zseztJP9XXJEqcVpP113GtjKVaYsYc/RVubPsEKEZ5Cw1PpQDpN65VARtKTH
         MMYlJhXELBzSQMrTKSlgVdmANr1XzrH+E6mzRbpgLRi6oJzws+xr5EPYZDCyXP7CdL6E
         aQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KqtmvIeCcEE4/0N0FwB4Be0GcMo80VuNERTsRMZmWY8=;
        b=cSeulsTLswyqRPgtsGEOm55fg99MzS3qeW/vLkiBFCb1rhHUztN1dhEMBG84Gz9/kv
         vIy2/UPKz+mN9BvIipO67dzpReY2XG192fpiv/LvvACx3WihuqWe8P34+ndT1KQQ6MY0
         zpVFnaejpSt+cYGgcQ7RmppS6AqWcVgvosjLO2X1FTfTQuAzVLbeit05oUZ1ira1o68U
         e6tAmKtcwzU+JBfxj01PDc+D5uU3IXHBtyA0T/OIxzPmf8KSONNeXYNs0pJeZ9EWyg3R
         ECMMZJw5zwzAokKk57bFOL4zQ1G1asRXEw6JiV85P9+vyoFrguWwaC7p5076uyXT6Jzx
         Julw==
X-Gm-Message-State: AOAM5307QYOZmeYXf5hN2OAjoEzNYz3Tp7JVSI/1I34JKoyhL6IvdHhe
        d/Oqw8I9K3ZSz86DCKCHpdXZKLkiLIyRhsRG2FI=
X-Google-Smtp-Source: ABdhPJzjJQXk1LfOeoT8BLyHAQ5mGIVCdPsCssU1DbU5ljyYDHA3v+4JutMxyMOTt76qlVclDHh0ntuxQd8atHvUB1I=
X-Received: by 2002:a63:3e05:: with SMTP id l5mr3386282pga.74.1604522263794;
 Wed, 04 Nov 2020 12:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20201104160344.4929-1-coiby.xu@gmail.com> <20201104160344.4929-2-coiby.xu@gmail.com>
In-Reply-To: <20201104160344.4929-2-coiby.xu@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 22:38:32 +0200
Message-ID: <CAHp75Vf8NMWL99Eo5k8gLwYSjUjfU6wjoh97YzVz+M=nwGNfrg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: amd: fix incorrect way to disable debounce filter
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 6:05 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> The correct way to disable debounce filter is to clear bit 5 and 6
> of the register.
>
> Cc: Hans de Goede <hdegoede@redhat.com>

> Message-ID: <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>

Can you use a Link tag with proper lore.kernel.org URL?

-- 
With Best Regards,
Andy Shevchenko
