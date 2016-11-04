From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: cherryview: Serialize register access in
 suspend and resume hooks
Date: Fri, 4 Nov 2016 16:15:59 +0100
Message-ID: <CACRpkdbgvVzv0YVmt7CQ6uwnsAtLnNoFJs6a8vopngb6CQVFqQ@mail.gmail.com>
References: <20161031145734.193016-1-mika.westerberg@linux.intel.com> <CACRpkdYTjFBj4EAvFWtaAu7aaxbKkXy6HffXOzAnBCPKehWRtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYTjFBj4EAvFWtaAu7aaxbKkXy6HffXOzAnBCPKehWRtQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Christian Steiner <christian.steiner@outlook.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 4, 2016 at 4:12 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Oct 31, 2016 at 3:57 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>
>> If async suspend is enabled, the driver may access registers concurrently
>> with another instance which may fail because of the bug in Cherryview GPIO
>> hardware. Prevent this by taking the shared lock while accessing the
>> hardware in suspend and resume hooks.
>>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> Patch applied.

Mika should this and patch 2/3 be tagged for stable?

Yours,
Linus Walleij
