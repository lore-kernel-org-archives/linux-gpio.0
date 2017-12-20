From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: sysfs: change 'value' attribute to prealloc
Date: Wed, 20 Dec 2017 10:32:51 +0100
Message-ID: <CACRpkdaCyiriM3xLJQ=OmcVRV6YY94mqsyaje1g2Fo_FMC1W6w@mail.gmail.com>
References: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33652 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754164AbdLTJcw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 04:32:52 -0500
Received: by mail-it0-f67.google.com with SMTP id o130so10928802itg.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 01:32:52 -0800 (PST)
In-Reply-To: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Mon, Dec 18, 2017 at 11:08 AM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> The GPIO 'value' attribute is time critical. A small bench with
> 'perf record' on the app below shows that 80% of the time spent in
> sysfs_kf_seq_show() is spent in memset() for zeroising the buffer.
>
> |--67.48%--sysfs_kf_seq_show
> |          |
> |          |--54.40%--memset
> |          |
> |          |--11.49%--dev_attr_show
> |          |          |
> |          |          |--10.06%--value_show
> |          |          |          |
> |          |          |          |--4.75%--sprintf
> |          |          |          |          |
>
> This patch changes the attribute type to prealloc, eliminating the
> need to zeroise the buffer at each read. 'perf record' gives the
> following result.
>
> |--42.41%--sysfs_kf_read
> |          |
> |          |--39.73%--dev_attr_show
> |          |          |
> |          |          |--38.23%--value_show
> |          |          |          |
> |          |          |          |--29.22%--sprintf
> |          |          |          |          |
>
> Test done with the following small app:
>
> int main(int argc, char **argv)
> {
>         int fd = open(argv[1], O_RDONLY);
>
>         for (;;) {
>                 int buf[512];
>
>                 read(fd, buf, 512);
>                 lseek(fd, 0, SEEK_SET);
>         }
>         exit(0);
> }
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

I applied this because I don't want to waste honest development efforts.

Fixes and improvements I can accept. But not extensions.

But as Bartosz says it would be nice to focus efforts on the non-deprecated
ABI.

Yours,
Linus Walleij
