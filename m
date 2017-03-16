From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] gpio: mvebu: let the compiler inline
Date: Thu, 16 Mar 2017 16:44:58 +0100
Message-ID: <CACRpkdaPMc8pe7cPuggr-ch8c7e7exXuempYFWv02yvD6wuP+A@mail.gmail.com>
References: <20170316063402.8667-1-ralph.sennhauser@gmail.com> <20170316063402.8667-7-ralph.sennhauser@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170316063402.8667-7-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 16, 2017 at 7:34 AM, Ralph Sennhauser
<ralph.sennhauser@gmail.com> wrote:

> A modern compiler should know better when to inline, so drop the inline
> keywords.
>
> Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>

A bit hesitant about this but whatever, patch applied.

Yours,
Linus Walleij
