Return-Path: <SRS0=dRYU=DF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C71C4727F
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Sep 2020 10:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B93302073A
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Sep 2020 10:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=wildgooses.com header.i=@wildgooses.com header.b="RIKHkhT3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgI1Kd4 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 28 Sep 2020 06:33:56 -0400
Received: from mail1.nippynetworks.com ([91.220.24.129]:44424 "EHLO
        mail1.nippynetworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgI1Kdz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:33:55 -0400
Received: from macbookpro-ed.wildgooses.lan (unknown [212.69.38.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-256))
        (No client certificate requested)
        (Authenticated sender: ed@wildgooses.com)
        by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4C0Jlb4LrLzTgQY;
        Mon, 28 Sep 2020 11:33:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1601289233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eNzyi2kqeWuXtwvd5AimJlA3bj0sWl7vjhB/3D/gIKo=;
        b=RIKHkhT3D9qx4osy+CySyCw+3zhmtmttduL6812je63zt2v6BjT8WCTDaJPjw0gIqCvnqk
        33ojl8f9NT9QpVrr1oft6vVARSgdF4CcfXQH41Go8J6K8/VY8fP0Co2M6zWo+a4AMsOLx0
        Ueh6CFOIPwMS2I+GnSjfcINAUcmacBo=
Subject: Re: [PATCH] gpio: gpio-amd-fch: Fix typo on define of
 AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
From:   Ed W <lists@wildgooses.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Eckert <fe@dev.tdt.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20200920203207.25696-1-lists@wildgooses.com>
 <CAHp75Vd2uz-QrEFshUr=e719VBX2zYzvOhVC07BpHfvi0WDgOA@mail.gmail.com>
 <deb07bad-2d84-723a-7237-2b625a3c4de8@wildgooses.com>
Message-ID: <815ff3a6-8941-573d-36c0-36639f47dc04@wildgooses.com>
Date:   Mon, 28 Sep 2020 11:33:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.0
MIME-Version: 1.0
In-Reply-To: <deb07bad-2d84-723a-7237-2b625a3c4de8@wildgooses.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkKCkNvdWxkIEkgZ2V0IGEgZmluYWwgb3BpbmlvbiAob3Igc2lnbm9mZikgb24gdGhpcyBw
YXRjaCBwbGVhc2U/CgpUaGUgc2lnbmlmaWNhbnQgdHlwbyBpcyB0aGUgcmVmZXJlbmNlIHRv
ICI1OSIsIHdoZW4gdGhlIEdQSU8gaXMgYWN0dWFsbHkgNTUKCkFjY29yZGluZyB0byB0aGUg
UENFbmdpbmVzIHNjaGVtYXRpYyB0aGUgbmFtZXMgb2YgdHdvIHNpbWlsYXIgR1BJT3MgYXJl
CsKgwqDCoCBHNTkvREVWU0xQMQrCoMKgwqAgRzU1L0RFVlNMUAoKVGhlIG9yaWdpbmFsIGRl
dmVsb3BlciBuYW1lZCB0aGUgc2Vjb25kIEdQSU8gd2l0aCBhIHRyYWlsaW5nIDAsIHdoaWNo
IGRvZXNuJ3Qgc2VlbSB1bnJlYXNvbmFibGUsCmhlbmNlIEkganVzdCBjb3JyZWN0ZWQgdGhl
IG5hbWUgdG86CsKgwqDCoCBBTURfRkNIX0dQSU9fUkVHX0dQSU81NV9ERVZTTFAwCkhvd2V2
ZXIgYW5vdGhlciBhY2NlcHRhYmxlIG5hbWUgY291bGQgYmU6CsKgwqDCoCBBTURfRkNIX0dQ
SU9fUkVHX0dQSU81NV9ERVZTTFAKCklmIEkgY291bGQgYXNrIGZvciBzb21lIGd1aWRhbmNl
IGFuZCBpZiBuZWNlc3NhcnkgSSB3aWxsIHJlc3VibWl0IHRoaXMgcGF0Y2g/IEVucmljbywg
ZG8geW91IGhhdmUgYW4Kb3Bpbmlvbj8KCkhvd2V2ZXIsIHBlcmhhcHMgaXQncyBhbHJlYWR5
IGFjY2VwdGFibGUgYXMgaXM/CgpLaW5kIHJlZ2FyZHMKCkVkIFcKCgpPbiAyMS8wOS8yMDIw
IDA5OjQwLCBFZCBXIHdyb3RlOgo+IE9uIDIxLzA5LzIwMjAgMDg6NTUsIEFuZHkgU2hldmNo
ZW5rbyB3cm90ZToKPj4gT24gU3VuLCBTZXAgMjAsIDIwMjAgYXQgMTE6MzMgUE0gRWQgV2ls
ZGdvb3NlIDxsaXN0c0B3aWxkZ29vc2VzLmNvbT4gd3JvdGU6Cj4+PiBTY2hlbWF0aWNzIHNo
b3cgdGhhdCB0aGUgR1BJTyBudW1iZXIgaXMgNTUgKG5vdCA1OSkuIFRyaXZpYWwgdHlwby4K
Pj4gRG9lcyBpdCBzdGlsbCBERVZTTFAwPyBQZXJoYXBzIHlvdSBuZWVkIHRvIGRyb3AgdGhh
dCBwYXJ0IGFzIHdlbGwuCj4+Cj4+IC4uLgo+Cj4KPiBJbiB0aGUgUENFbmdpbmVzIHNjaGVt
YXRpYyBpdCdzIGxhYmVsbGVkIGFzICJHNTUvREVWU0xQIiAobm8gMCkKPgo+IChJbiBjb250
cmFzdCBHNTkgaXMgbGFiZWxsZWQgIkc1OS9ERVZTTFAxIikKPgo+IFdoYXQgaXMgdGhlIHF1
b3J1bSBvcGluaW9uIG9uIG5hbWU/Cj4KPiBUaGFua3MKPgo+IEVkIFcKPgo+Cj4+Cj4+PiDC
oCAjZGVmaW5lIEFQVTJfR1BJT19SRUdfTEVEM8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBB
TURfRkNIX0dQSU9fUkVHX0dQSU81OV9ERVZTTFAxCj4+PiDCoCAjZGVmaW5lIEFQVTJfR1BJ
T19SRUdfTU9ERVNXwqDCoMKgwqDCoMKgwqDCoMKgwqAgQU1EX0ZDSF9HUElPX1JFR19HUElP
MzJfR0UxCj4+PiDCoCAjZGVmaW5lIEFQVTJfR1BJT19SRUdfU0lNU1dBUMKgwqDCoMKgwqDC
oMKgwqDCoCBBTURfRkNIX0dQSU9fUkVHX0dQSU8zM19HRTIKPj4+IC0jZGVmaW5lIEFQVTJf
R1BJT19SRUdfTVBDSUUywqDCoMKgwqDCoMKgwqDCoMKgwqAgQU1EX0ZDSF9HUElPX1JFR19H
UElPNTlfREVWU0xQMAo+Pj4gKyNkZWZpbmUgQVBVMl9HUElPX1JFR19NUENJRTLCoMKgwqDC
oMKgwqDCoMKgwqDCoCBBTURfRkNIX0dQSU9fUkVHX0dQSU81NV9ERVZTTFAwCj4+PiDCoCAj
ZGVmaW5lIEFQVTJfR1BJT19SRUdfTVBDSUUzwqDCoMKgwqDCoMKgwqDCoMKgwqAgQU1EX0ZD
SF9HUElPX1JFR19HUElPNTEKPj4+Cj4+PiDCoCAvKiBPcmRlciBpbiB3aGljaCB0aGUgR1BJ
TyBsaW5lcyBhcmUgZGVmaW5lZCBpbiB0aGUgcmVnaXN0ZXIgbGlzdCAqLwo+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvL2dwaW8tYW1kLWZjaC5o
Cj4+PiBiL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvL2dwaW8tYW1kLWZjaC5o
Cj4+PiBpbmRleCA5ZTQ2Njc4ZWQuLjI1NWQ1MWM5ZCAxMDA2NDQKPj4+IC0tLSBhL2luY2x1
ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvL2dwaW8tYW1kLWZjaC5oCj4+PiArKysgYi9p
bmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpby9ncGlvLWFtZC1mY2guaAo+Pj4gQEAg
LTE5LDcgKzE5LDcgQEAKPj4+IMKgICNkZWZpbmUgQU1EX0ZDSF9HUElPX1JFR19HUElPNDnC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg0MAo+Pj4gwqAgI2RlZmluZSBBTURf
RkNIX0dQSU9fUkVHX0dQSU81MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDQx
Cj4+PiDCoCAjZGVmaW5lIEFNRF9GQ0hfR1BJT19SRUdfR1BJTzUxwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDB4NDIKPj4+IC0jZGVmaW5lIEFNRF9GQ0hfR1BJT19SRUdfR1BJ
TzU5X0RFVlNMUDDCoMKgwqDCoMKgwqDCoCAweDQzCj4+PiArI2RlZmluZSBBTURfRkNIX0dQ
SU9fUkVHX0dQSU81NV9ERVZTTFAwwqDCoMKgwqDCoMKgwqAgMHg0Mwo+Pj4gwqAgI2RlZmlu
ZSBBTURfRkNIX0dQSU9fUkVHX0dQSU81N8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweDQ0Cj4+PiDCoCAjZGVmaW5lIEFNRF9GQ0hfR1BJT19SRUdfR1BJTzU4wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4NDUKPj4+IMKgICNkZWZpbmUgQU1EX0ZDSF9HUElP
X1JFR19HUElPNTlfREVWU0xQMcKgwqDCoMKgwqDCoMKgIDB4NDYKPj4KPgoK
