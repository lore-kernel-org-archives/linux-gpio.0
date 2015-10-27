From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: the needless loop?
Date: Tue, 27 Oct 2015 16:27:13 +0100
Message-ID: <CACRpkdbb+2=fyTC_tJqH8RPHV+-x5OTmv8RU4EMx4O23n5zDzw@mail.gmail.com>
References: <1445445900.22669.41.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34230 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932274AbbJ0P1O (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2015 11:27:14 -0400
Received: by obbza9 with SMTP id za9so55603484obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2015 08:27:13 -0700 (PDT)
In-Reply-To: <1445445900.22669.41.camel@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, Laurent Meunier <laurent.meunier@st.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 21, 2015 at 6:45 PM, Shevchenko, Andriy
<andriy.shevchenko@intel.com> wrote:

> Catch such code in pinconf.c
>
>          for (j = 0; j < map->data.configs.num_configs; j++) {
>                  if (!strcmp(map->data.configs.group_or_pin,
>                                  dbg->pin_name)) {
>                          /* We found the right pin / state */
>                          found = map;
>                          break;
>                  }
>          }
>
> I do not get how the result of strcmp() would be different during the
> loop. Can you elaborate?

As you can see from git blame Laurent Meunier wrote this code,
(commit f07512e615dd8) so let's
ask him. I suspect a simple copy/paste error? Laurent?

Yours,
Linus Walleij
