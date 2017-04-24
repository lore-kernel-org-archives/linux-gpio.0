From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: Add a driver for Cadence GPIO controller
Date: Mon, 24 Apr 2017 15:00:10 +0200
Message-ID: <CACRpkdZSyjZCe_02uoU0kFabaDR9DDpWhKowZ6rPO_v0N6WfOQ@mail.gmail.com>
References: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
 <CACRpkdZ6w_tuzSNmFE=2BpeASNOSq0cV4fYM6F8-57Q2+3n-aQ@mail.gmail.com>
 <20170330132946.41314874@bbrezillon> <3422ee23-53b5-8d09-2a5e-d700358ab09d@cadence.com>
 <20170410152610.58bc589a@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170410152610.58bc589a@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Simon Hatliff <hatliff@cadence.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 10, 2017 at 3:26 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> Linus, what should I do here? Drop support for edge interrupts?

Do whatever makes most sense for your usecases.
I certainly allow dirty hacks if it is to be able to use the hardware
at all.

Yours,
Linus Walleij
