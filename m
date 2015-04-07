From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 38/86] gpio/sch: use uapi/linux/pci_ids.h directly
Date: Tue, 7 Apr 2015 15:03:56 +0200
Message-ID: <CACRpkdb+nCreshrks9=ocEmrHDX3Pa3qtCaUuQWqvU37VieL9w@mail.gmail.com>
References: <1427635734-24786-1-git-send-email-mst@redhat.com>
	<1427635734-24786-39-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427635734-24786-39-git-send-email-mst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Mar 29, 2015 at 3:40 PM, Michael S. Tsirkin <mst@redhat.com> wrote:

> Header moved from linux/pci_ids.h to uapi/linux/pci_ids.h,
> use the new header directly so we can drop
> the wrapper in include/linux/pci_ids.h.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Patch applied.

Yours,
Linus Walleij
