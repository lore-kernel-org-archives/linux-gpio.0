Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028252E070
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074087; cv=pass; b=bNadT8hKdPt1WJqUyyolC3tPY+/9STBvxeEqEY2zzhZCQ+uyLUyBcwSVtRQfctCPmChWqsCPx74MxzYDgXgbp1WH9LOvLZ5Sk0fBpoqQv68HOrSzPVFQuI+SOACDXjQT+cwtwQ/3B1rlqbiNbgyWcNpIa4Hr2txf7IEtItd1Wj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074087; c=relaxed/simple;
	bh=HayAmmLBI/WF/AkMleopvPrrdy1dOmE7xAMyDaxUghs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uJDdeM3CEHdZ/6TsixuHNAn7Rf/ckkxWiqZ4JI/i68dt2XozNfsU8bo7AU9wNae4bm01kTcjnXEDABs+rrVJ1L4j21DMAczWsmiSEKIDtUPwznBVObQBBbzSrovtvJkX5E6NMzNAewmyIxENkxmNhJTd9vWRLxOdgLBMJ2Fuwe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9t4XZf4; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9t4XZf4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3ee49054ecso139987766b.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792074084; cv=none;
        d=google.com; s=arc-20260327;
        b=Wm6V4zrTkw285/SId9tlzFVkvgryfq+BFF0VAtnFKwl1Ha5+zRrWsLEfb4LoIybQ5y
         UtsRTV0wcPQHlnXjo5T6UTsrY5nXfax6CodtPNIJIANJPRGTxFUNJ6us/gbDFY3EBUXr
         yxb5yHi8vkk8Jalipw0uVW52qlM4TDXx3WViN5+6iortz90tAoihUjEuKv4WFB7Iq8+A
         ptwzz24tpsiIz9mD5aPKuoZP3kX6Q5yjPGzTItVgcQoM1EmdEMoYf+EeTZ6NZ7YHJIJh
         vIAVA/nw3VC0EP8sFz/8V1hAlwUiuesS0h42gQHN0+hHBqNIw7XS3rOI8kHdJuK+8h4f
         1uFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/8EK0KxjKp+jZTxkjps+lH3/bw/OLb+7lXjV6iL/Kg0=;
        fh=7n2Z1c79beh8O3IiQ82SJaQheDaE7stg0cwHtB5Ta8A=;
        b=haheFcoH1YIP6G3i1SkPIR0TVpl3kehpLq6kxcBtUta/O0HMqViYGgHHfzr2ywQM10
         Y9MVkZamVxIP8QUtzAoKHJEiRLB4KByPV3HX2FeylHnGXOGx4gfvcBVuWhYioAZ+iiHK
         tG6mQTCVXVRxbqgmYrfMzUhJqzGO9sE61stCbk/cnwl956GNMUQhj0lgdSn1W9casO7v
         /aTUxqQL/VS6NGrjnH0RWVN5TVpsXfaQdVV9ZnksmDrLH4hz1lwvPI//6XDutA42omTP
         gq0kqZ84R3lHYDU1BdOFwASslnX8O+iQWeWglda68SKspZzlAT5Bl4Bq5NkD7rX+7WN3
         f7Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792074084; x=1792678884; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8EK0KxjKp+jZTxkjps+lH3/bw/OLb+7lXjV6iL/Kg0=;
        b=a9t4XZf4lD2RH6Opnxarq8DY5cG8RuKSSxlox17uQS16Q1eTCERhSxvhLUPsiFVY/f
         2AQI7VRn7qPkDK+U8qg7Ch0yWttplnGd91uu1yYM1uCqcFo0/Nhxodg8OTgOps649y71
         q+g6QY0RlacumowbPGNj4m/JvCtA++xWMxxpXvTld8gtjTWCC6GumNaCSzxiOTIcC2nG
         TMu5r/6RrUgRRK91kFx4fnzueF0RQlJrDbaGOVC1/JMeDfpwwMOLbwMddjg9ztlCOTAH
         C2zgFqGRrRgx6ag6Gmsb/0oBDV/SyncCiJKM20np9K2b/lqEDe3Bd8rsNDuteF2nO1mk
         7sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074084; x=1792678884;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/8EK0KxjKp+jZTxkjps+lH3/bw/OLb+7lXjV6iL/Kg0=;
        b=ohUvUkxQrmNJr6fICtqeEe9q2R9cA2r4C8AvGkGHznvbbKLjA9/RCGTWSG2Y/PT29b
         akNsg5c7VOYoK0d0aYp2yHS8M2KOYnCVMJCVogdB+WLSKTdLVaPyRJe92EadHT7Od+fD
         lQTf8sX2NTEIsmyvfpjkAWL+i0Qtec81jvLmXM3JGr7qHfz+uUjVrs3iBFU9rY+ml0kb
         wFgHpBESvBYbPx4ortC+SJ8Aovb/hfRQ/2Re1JFyuUIIjsy5xTli3Zhe2Nu3vjk2QdRH
         2K/XmCn82nl6HpJIyi9M5Q1WOSEs05dHbWIP8F2rfukcW7aBcS+sonBumcBUHTIWOt7e
         3TYA==
X-Gm-Message-State: AFq9FYLysga3vF0LakF7W127q1qFyk6+psFOqwRrFoSkl3TujcUJX9Ph
	2Ah6XmyAocis7RWxciTOr+XpFDlno7vCTm1/ccSWdV0lHy5KxB1dLE0u6sOZFAx34E/HRAz4qb/
	X/JtaT85oNpQsTWmuR68pnE8LY31290g=
X-Gm-Gg: AYBFou2rQqyUVoFd+hAbTitVgx2nCjwRVC+VktF7hyGRTqrbBGJ/fZckbHm9WWV0Lof
	uzKNfdVDLV/kEa5LKkhyh/lIp1Y+JFg0ya8xIF3wRCkaUdv0r1CDBhVEVGkz0RYE19apd9JMC8t
	A4zV4ufc4GGGwhwjnewl7L2j1J2WrG+JyTSUZ/+wthBxru+2wEYINvcI7F5AZppo4PiT5uAaLAP
	i2h02YIoAbb5sPWVymnxC4T/9IgzUjG+5TMBo2a/bvRfgU7JQkIz2GAnMULtf3Bjy3m7z+a4nKm
	T7PvYH8mqxIS52i/irukCIZBzLyoBTVYS8/AG+PYuyFTEPoKKGUKBgCsa2I73JNy8TrVnnJBxbd
	RUHCVjcru5g==
X-Received: by 2002:a17:907:7ba3:b0:c29:f5d5:5aa1 with SMTP id
 a640c23a62f3a-c31aa097acdmr1897928666b.43.1792074084318; Thu, 15 Oct 2026
 07:21:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nikodem Sanecki <nikodemsanecki@gmail.com>
Date: Thu, 15 Oct 2026 15:21:11 +0100
X-Gm-Features: AclHuK-uMeM2OT-1SvHDE5B8L4CFd9ifGhVLzzenOjl_5vJC1fOzzee1rHAuyPI
Message-ID: <CAAUQFROUNCJo7EUn4eiDxSTd6pfPcQDP1_ma0G2k73DJtMnNVw@mail.gmail.com>
Subject: Hello, I'm reporting a Caps Lock LED issue on my Lenovo ThinkPad L13
 Gen 2 AMD running Arch Linux. I found a workaround that completely fixes it,
 and I hope the findings might help implement a permanent kernel fix. **A
 quick note:** This is my first time using Linux, and I'm a complete beginner
 when it comes to kernel development. I used ChatGPT (GPT-6) to guide the
 troubleshooting process, analyse my laptop's ACPI firmware, and interpret the
 results. I personally ran the diagnostic commands and verified the observed
 behaviour, but the technical explanation below is AI-assisted. Please correct
 me if any of the analysis is inaccurate. ## Problem Under Linux, the physical
 Caps Lock indicator LED never illuminates, even though the Caps Lock key
 itself works normally. The LED works correctly under Windows and during
 certain stages of boot, so the hardware itself is functional. After
 investigating, GPT-6 identified what appears to be a conflict involving GPIO
 11 on the AMD AMDI0...
To: westeri@kernel.org, andriy.shevchenko@linux.intel.com
Cc: linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Resending this report in plain text because my original email was
rejected by the linux-gpio and linux-kernel mailing lists for
containing HTML formatting. Apologies if you received the original
message twice.


Hello,

I'm reporting a Caps Lock LED issue on my Lenovo ThinkPad L13 Gen 2
AMD running Arch Linux. I found a workaround that completely fixes it,
and I hope the findings might help implement a permanent kernel fix.

A quick note: This is my first time using Linux, and I'm a complete
beginner when it comes to kernel development. I used ChatGPT (GPT-6)
to guide the troubleshooting process, analyse my laptop's ACPI
firmware, and interpret the results. I personally ran the diagnostic
commands and verified the observed behaviour, but the technical
explanation below is AI-assisted. Please correct me if any of the
analysis is inaccurate.

Problem

Under Linux, the physical Caps Lock indicator LED never illuminates,
even though the Caps Lock key itself works normally.

The LED works correctly under Windows and during certain stages of
boot, so the hardware itself is functional.

After investigating, GPT-6 identified what appears to be a conflict
involving GPIO 11 on the AMD AMDI0030 controller.

Booting Arch Linux with this kernel parameter completely fixes the problem:

gpiolib_acpi.ignore_interrupt=AMDI0030:00@11

The Caps Lock LED now works normally, and I haven't noticed any other
hardware issues.

System information

Device: Lenovo ThinkPad L13 Gen 2 AMD

DMI product name: 21AB004LSP

DMI product version/family: ThinkPad L13 Gen 2a

DMI vendor: LENOVO

DMI product SKU: LENOVO_MT_21AB_BU_Think_FM_ThinkPad L13 Gen 2a

Kernel: 7.2.9-arch1-1

Distribution: Arch Linux

BIOS: R1QET54W (1.40)

BIOS date: 2026-04-14

DSDT OEM ID: LENOVO

DSDT OEM Table ID: TP-R1Q

Diagnostic findings

The following is GPT-6's analysis of the diagnostic output and
decompiled ACPI tables.

1. Linux sends the correct keyboard LED commands

Using bpftrace, we observed that atkbd_set_leds() consistently returned 0.

Tracing ps2_command() for command 0x10ED produced:

SETLEDS: value=4, caps=1
SETLEDS: value=0, caps=0
SETLEDS: value=4, caps=1
SETLEDS: value=0, caps=0

The driver reports success and sends the expected Caps Lock states,
but the physical indicator stays off.

2. The embedded controller tracks Caps Lock correctly

The DSDT defines the CPLS field at EC offset 0x0F, bit 7.

Reading that byte through the read-only ec_sys interface showed it
changing from 0x00 to 0x80 when Caps Lock was toggled.

Enabling dynamic debugging in drivers/acpi/ec.c confirmed that each
Caps Lock press triggered EC query 0x78, which was scheduled, started
and stopped successfully.

3. Lenovo's firmware controls GPIO 11

The DSDT contains:

Method (_Q78, 0, NotSerialized)
{
    If (CPLS)
    {
        WFIO (0x0B, 0x00)
    }
    Else
    {
        WFIO (0x0B, 0x01)
    }
}

The WFIO method writes bit 22 using WMEM(), targeting address
0xFED81500 + (11 * 4) = 0xFED8152C.

This appears to control the Caps Lock indicator using GPIO 11.

4. The same GPIO is declared as an ACPI interrupt

In SSDT12, _SB.GPIO._AEI declares GPIO 11 as an edge-triggered,
active-low, exclusive wake interrupt.

Its _EVT handler includes:

Case (0x0B)
{
    MSTP (0x3911)
    Notify (\_SB.PCI0.GPP1, 0x00) // Bus Check
}

This appears to conflict with the firmware's use of GPIO 11 as an output.

5. GPIO registers confirm the suspected conflict

Without the workaround, /sys/kernel/debug/gpio showed:

#11 ... input ... 0x457a00
#11 ... input ... 0x057a00

Pressing Caps Lock changed bit 22, but bit 23 (output enable) remained cleared.

After booting with:

gpiolib_acpi.ignore_interrupt=AMDI0030:00@11

The result was:

#11 ... output ... 0xc50000

The output-enable bit was now set, and the physical Caps Lock LED
worked flawlessly.

The system was already using atkbd.reset=1 for a separate
keyboard-backlight problem. That parameter alone had not fixed the
Caps Lock LED.

Possible explanation

GPT-6's interpretation is that Linux's ACPI GPIO handling configures
GPIO 11 as an interrupt input because of the firmware's _AEI
declaration.

That disables the output driver, even though the firmware continues
updating the GPIO output-value bit when Caps Lock changes.

Ignoring the interrupt allows the pin to remain configured as an
output, restoring the indicator.

Related upstream fix

This seems very similar to the Acer Nitro V 16S AI issue addressed by:

6da1f3437435c82eaa15b121022474bb358ffe20

"gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro V 16S AI"

https://lists.openwall.net/linux-kernel/2026/10/02/1029

However, there is an important difference.

On my ThinkPad, the GPIO 11 _EVT handler issues a PCIe bus-check
notification. I therefore don't know whether permanently ignoring the
interrupt could interfere with PCIe-related events, hot-plugging or
wake behaviour.

So far, normal use with the workaround appears unaffected, but I
haven't exhaustively tested those scenarios.

Question

Would a DMI-specific gpiolib ACPI quirk be appropriate for this
ThinkPad, or should the conflicting GPIO declaration be handled
differently because of the PCIe notification?

I can provide the relevant decompiled DSDT/SSDT excerpts, additional
diagnostic logs, or test a proposed fix if that would help.

Thanks very much for your time, and apologies if I've misunderstood
any of the technical details. I'm happy to run further tests with
guidance.

Best regards
