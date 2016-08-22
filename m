From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: palmas: fix a possible NULL dereference
Date: Mon, 22 Aug 2016 14:11:24 +0200
Message-ID: <CACRpkdb=MsDM_4eQkjyJCfcFyCs=+RDpLemApAj8YaD9kzyYUg@mail.gmail.com>
References: <1471336613-25040-1-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471336613-25040-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 16, 2016 at 10:36 AM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:

> of_match_device could return NULL, and so cause a NULL pointer
> dereference later at line 1009:
> pinctrl_data = match->data;
>
> For fixing this problem, we use of_device_get_match_data(), this will
> simplify the code a little by using a standard function for
> getting the match data.
>
> Reported-by: coverity (CID 1324136)
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>

Patch applied.

Yours,
Linus Walleij
