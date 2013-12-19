From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: [PATCH v2] Tracing events with GPIOs
Date: Thu, 19 Dec 2013 20:54:35 +0100
Message-ID: <1387482876-17454-1-git-send-email-jjhiblot@traphandler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: masami.hiramatsu.pt@hitachi.com, tom.zanussi@linux.intel.com, gnurou@gmail.com
Cc: rostedt@goodmis.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: linux-gpio@vger.kernel.org

Following the advice of Masami, I implemented the GPIO trace on top of the event
triggers (git://git.yoctoproject.org/linux-yocto-contrib
tzanussi/event-triggers-v11)

Alexandre,
This version uses the old gpio API (i-e gpio identifed by integers). GPIOs are
not requested in this patch, allowing any gpio to be used as a probe. It's a bit
dangerous but I think it's okay for the moment. When this patch is adapted to the
gpio descriptor API, we'll have to find a way to request the gpio properly.

Jean-Jacques Hiblot (1):
  Tracing events with GPIOs

 include/linux/ftrace_event.h        |   1 +
 kernel/trace/trace_events_trigger.c | 285 ++++++++++++++++++++++++++++++++++++
 2 files changed, 286 insertions(+)

-- 
1.8.3.1
