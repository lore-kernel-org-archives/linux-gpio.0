From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 1/5] bitops: Introduce assign_bit()
Date: Thu, 12 Oct 2017 11:30:17 -0700
Message-ID: <20171012113017.a088595ca60df1d591aebe38@linux-foundation.org>
References: <cover.1507797496.git.lukas@wunner.de>
        <2ca70faf07383482eed6263c00cf9141f930653b.1507797496.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2ca70faf07383482eed6263c00cf9141f930653b.1507797496.git.lukas@wunner.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, Bart Van Assche <bart.vanassche@wdc.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Neil Brown <neilb@suse.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Theodore Ts'o <tytso@mit.edu>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Denys Vlasenko <dvlasenk@redhat.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 12 Oct 2017 12:40:10 +0200 Lukas Wunner <lukas@wunner.de> wrote:

> A common idiom is to assign a value to a bit with:
> 
>     if (value)
>         set_bit(nr, addr);
>     else
>         clear_bit(nr, addr);
> 
> Likewise common is the one-line expression variant:
> 
>     value ? set_bit(nr, addr) : clear_bit(nr, addr);
> 
> Commit 9a8ac3ae682e ("dm mpath: cleanup QUEUE_IF_NO_PATH bit
> manipulation by introducing assign_bit()") introduced assign_bit()
> to the md subsystem for brevity.
> 
> Make it available to others, specifically gpiolib and the upcoming
> driver for Maxim MAX3191x industrial serializer chips.
> 
> As requested by Peter Zijlstra, change the argument order to reflect
> traditional "dst = src" in C, hence "assign_bit(nr, addr, value)".

Acked-by: Andrew Morton <akpm@linux-foundation.org>
