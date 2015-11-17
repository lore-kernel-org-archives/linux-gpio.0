From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: palmas: fix a possible NULL dereference
Date: Tue, 17 Nov 2015 14:41:26 +0100
Message-ID: <CACRpkdZWiKhMiNO6LCOK5Ayt2ny1y7Ce0Du0SLp2nJ=qfB+Qrw@mail.gmail.com>
References: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
	<1447273657-1668-3-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447273657-1668-3-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2015 at 9:27 PM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:

> of_match_device could return NULL, and so cause a NULL pointer
> dereference later.
>
> Reported-by: coverity (CID 1130700)
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>

Patch applied.

ALl of these seem pretty academic, as the match table is likely
the same that causes the device core to call probe() in the
first place. But whatever.

Yours,
Linus Walleij
