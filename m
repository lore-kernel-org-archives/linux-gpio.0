From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Tracing events with GPIOs
Date: Thu, 2 Jan 2014 13:43:40 +0100
Message-ID: <CACRpkdYMBq267qW59QtEY6b+-jmqafnWRsuZOG=9FWF=aUpRpA@mail.gmail.com>
References: <1387239745-2890-1-git-send-email-jjhiblot@traphandler.com>
	<CAAVeFuKAGfnnsbtBg=zfmciyMdZHgrX_EpecqPjG=oO6rZdWag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuKAGfnnsbtBg=zfmciyMdZHgrX_EpecqPjG=oO6rZdWag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Steven Rostedt <rostedt@goodmis.org>, masami.hiramatsu.pt@hitachi.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2013 at 7:52 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, Dec 17, 2013 at 9:22 AM, Jean-Jacques Hiblot
> <jjhiblot@traphandler.com> wrote:
>>
>> This patch implements a new tracing mechanism based on kprobes and using GPIO.
>> Debugging with GPIO is very common in the embedded world. At least for those of us
>> fortunate enough to have an oscilloscope or a logic analyzer on their bench...
>> This is especially true if the issue results of a hardware/sofware interaction.
>>
>> Typical use cases are :
>> * mixed software/hardware debugging. For example when the software detects a
>>   situation of interest (typically an error) it toggles a GPIO to trigger the
>>   oscilloscope acquisition.
>> * direct latency/duration measurements.
>>
>> examples:
>> To trig the oscilloscope whenever a mmc command error:
>>   echo "p:my_mmc_blk_error mmc_blk_cmd_error gpiopulse@13" > /sys/kernel/debug/tracing/kprobe_events
>>   echo 1 > /sys/kernel/debug/tracing/events/kprobes/my_mmc_blk_error/enable

I've never seen the whole patch.

Can you please repost this and include linux-gpio@vger.kernel.org and also
me on the To: line?

Yours,
Linus Walleij
