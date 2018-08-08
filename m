From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] pinctrl: axp209: Fix NULL pointer dereference after allocation
Date: Wed, 8 Aug 2018 17:13:07 +0800
Message-ID: <CAGb2v6481_8sxGzpfzgi7J61OWDw6YFou4Lc3ve4qDTdNM0ayA@mail.gmail.com>
References: <20180806160635.9293-1-vasilyev@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806160635.9293-1-vasilyev@ispras.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vasilyev <vasilyev@ispras.ru>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, ldv-project@linuxtesting.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 7, 2018 at 12:06 AM, Anton Vasilyev <vasilyev@ispras.ru> wrote:
> There is no check that allocation in axp20x_funcs_groups_from_mask
> is successful.
> The patch adds corresponding check and return values.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>

Acked-by: Chen-Yu Tsai <wens@csie.org>
