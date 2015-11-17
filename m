From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: syscon: fix a possible NULL dereference
Date: Tue, 17 Nov 2015 14:39:59 +0100
Message-ID: <CACRpkdb7DT0FUfaaR6KQjf6ezHn02BC+rCQDAUf9nOWr+quBrA@mail.gmail.com>
References: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
	<1447273657-1668-2-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447273657-1668-2-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2015 at 9:27 PM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:

> of_match_device could return NULL, and so cause a NULL pointer
> dereference later at line 199:
> priv->flags = of_id->data;
>
> Reported-by: coverity (CID 1324140)
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>

Took out the previously applied version and applied this instead.

Yours,
Linus Walleij
