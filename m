From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/4] bitops: Introduce assign_bit()
Date: Tue, 22 Aug 2017 10:30:50 +0200
Message-ID: <20170822083050.GA12241@wunner.de>
References: <cover.1503319573.git.lukas@wunner.de>
 <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
 <1503332323.2571.5.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503332323.2571.5.camel@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bart Van Assche <Bart.VanAssche@wdc.com>, Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Theodore Ts'o <tytso@mit.edu>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Denys Vlasenko <dvlasenk@redhat.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "agk@redhat.com" <agk@redhat.com>, "phil@raspberrypi.org" <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "m.duckeck@kunbus.de" <m.duckeck@kunbus.de>, "snitzer@redhat.com" <snitzer@redhat.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2017 at 04:18:44PM +0000, Bart Van Assche wrote:
> On Mon, 2017-08-21 at 15:12 +0200, Lukas Wunner wrote:
> > Cc: Bart Van Assche <bart.vanassche@wdc.com>
> > Cc: Alasdair Kergon <agk@redhat.com>
> > Cc: Mike Snitzer <snitzer@redhat.com>
> > Signed-off-by: Lukas Wunner <lukas@wunner.de>
> 
> This Cc-list is incomplete. Previous <linux/bitops.h> patches went in
> through Andrew Morton's tree so I think an ack from Andrew Morton is
> needed before this patch can be sent to Linus Torvalds. Please also
> Cc other frequent contributors to this header file, e.g. Ingo Molnar
> and Peter Zijlstra. Please also consider to Cc the LKML for this patch
> or even for the entire series.

Fair enough, adding more folks to cc.  Does anyone have objections
or comments to the below patch and to merging it through linux-gpio?

It's part of this series:
https://www.spinics.net/lists/linux-gpio/msg25067.html

Looking at the mnemonics of x86 and arm I couldn't find one which
would avoid the jump and be faster/shorter than the inline functions
below, so putting this in include/linux/bitops.h (rather than
arch/*/include/asm/) seemed appropriate.  Can anyone imagine
doing the same quicker with inline assembly?


> > +static __always_inline void assign_bit(bool value, long nr,
> > +				       volatile unsigned long *addr)
>
> Why has __always_inline been specified? What makes you think that you know
> better than the compiler whether or not these functions should be inlined?

I carried this over from existing functions, see e.g. commit 1a1d48a4a8fd
("linux/bitmap: Force inlining of bitmap weight functions").

Thanks,

Lukas

-- >8 --
Subject: [PATCH 1/4] bitops: Introduce assign_bit()

A common idiom is to assign a value to a bit with:

    if (value)
        set_bit(nr, addr);
    else
        clear_bit(nr, addr);

Likewise common is the one-line expression variant:

    value ? set_bit(nr, addr) : clear_bit(nr, addr);

Commit 9a8ac3ae682e ("dm mpath: cleanup QUEUE_IF_NO_PATH bit
manipulation by introducing assign_bit()") introduced assign_bit()
to the md subsystem for brevity.

Make it available to others, in particular gpiolib and the upcoming
driver for Maxim MAX3191x industrial serializer chips.

Cc: Bart Van Assche <bart.vanassche@wdc.com>
Cc: Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/md/dm-mpath.c  |  8 --------
 include/linux/bitops.h | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 0e8ab5bb3575..c79c113b7e7d 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -638,14 +638,6 @@ static void process_queued_bios(struct work_struct *work)
 	blk_finish_plug(&plug);
 }
 
-static void assign_bit(bool value, long nr, unsigned long *addr)
-{
-	if (value)
-		set_bit(nr, addr);
-	else
-		clear_bit(nr, addr);
-}
-
 /*
  * If we run out of usable paths, should we queue I/O or error it?
  */
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index a83c822c35c2..097af36887c0 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -226,6 +226,30 @@ static inline unsigned long __ffs64(u64 word)
 	return __ffs((unsigned long)word);
 }
 
+/**
+ * assign_bit - Assign value to a bit in memory
+ * @value: the value to assign
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ */
+static __always_inline void assign_bit(bool value, long nr,
+				       volatile unsigned long *addr)
+{
+	if (value)
+		set_bit(nr, addr);
+	else
+		clear_bit(nr, addr);
+}
+
+static __always_inline void __assign_bit(bool value, long nr,
+					 volatile unsigned long *addr)
+{
+	if (value)
+		__set_bit(nr, addr);
+	else
+		__clear_bit(nr, addr);
+}
+
 #ifdef __KERNEL__
 
 #ifndef set_mask_bits
-- 
2.11.0
