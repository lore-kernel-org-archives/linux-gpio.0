From: Anton Sviridenko <anton@corp.bluecherry.net>
Subject: Some questions about gpio and IRQ relationship
Date: Fri, 10 Mar 2017 23:22:30 +0400
Message-ID: <CAAMwvWvLUeVX36eRY3yFZRKsW+RftOF7BWNDS4qgE1sTEizD0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ua0-f180.google.com ([209.85.217.180]:33950 "EHLO
        mail-ua0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933624AbdCJTWc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2017 14:22:32 -0500
Received: by mail-ua0-f180.google.com with SMTP id f54so119317868uaa.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2017 11:22:31 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hello,

there are some PCI/PCIe cards based on Softlogic solo6010/6110 chips,
chip provides hardware H.264 encoding, audio encoding and also some
GPIO pins available for general use, they can be used with external
hardware module for switching relays (output pins) and signalling
about alarms (input pins).

There is an existing driver solo6x10 in mainline Linux tree inside
drivers/media/pci/solo6x10 that provides V4L2 and ALSA interfaces to
userspace, I want to add GPIO interface support too, so GPIO pins can
be controlled by userspace software through sysfs interface for
gpio-s.

1) I don't understand clearly relation between gpio_chip and irq_chip
structures. In my case, PCI device requests some IRQ line for
signalling about things like completed encoding frame, finished DMA
transfer from internal RAM to system memory, etc. And it can also
signal about changed GPIO input. I.e. same single hardware interrput
is used for all events that happen in solo chip. And I want userspace
software to be able to use poll() on selected exported input GPIO pin
(/sys/class/gpio/gpioN/value) What exactly do I need to configure in
this case?


> GPIO irqchips usually fall in one of two categories:

>* CHAINED GPIO irqchips: these are usually the type that is embedded on
>  an SoC. This means that there is a fast IRQ flow handler for the GPIOs that
>  gets called in a chain from the parent IRQ handler, most typically the
>  system interrupt controller.


Does it correspond to this case? Device is usually attached to x86 PC
desktop/server.


2) Is it ok to add gpio code to existing module inside
drivers/media/pci/solo6x10 or it is better to create new module placed
in drivers/gpio/

Anton
