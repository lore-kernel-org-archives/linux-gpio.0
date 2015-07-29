From: =?utf-8?b?Sm/Do28=?= Paulo Rechi Vita <jprvita@gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Wed, 29 Jul 2015 08:51:45 +0000 (UTC)
Message-ID: <loom.20150729T103525-803@post.gmane.org>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com> <20150601092348.GK1747@lahna.fi.intel.com> <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com> <20150602141520.GE4057@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:59959 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750814AbbG2IzG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 29 Jul 2015 04:55:06 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glg-linux-gpio@m.gmane.org>)
	id 1ZKN8h-0000Hg-QI
	for linux-gpio@vger.kernel.org; Wed, 29 Jul 2015 10:55:04 +0200
Received: from 12.202.169.254 ([12.202.169.254])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2015 10:55:03 +0200
Received: from jprvita by 12.202.169.254 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2015 10:55:03 +0200
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

TWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmcgPGF0PiBsaW51eC5pbnRlbC5jb20+IHdyaXRlczoKCj4gCj4gT24gVHVlLCBKdW4gMDIsIDIwMTUgYXQgMDM6NTM6NDBQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDEsIDIwMTUgYXQgMTE6MjMgQU0sIE1pa2EgV2VzdGVyYmVyZwo+ID4gPG1pa2Eud2VzdGVyYmVyZyA8YXQ+IGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgTWF5IDIyLCAyMDE1IGF0IDEwOjU2OjA4QU0gKzAzMDAsIE1pa2EgV2VzdGVyYmVyZyB3cm90ZToKPiA+ID4+IEJJT1MvcGxhdGZvcm0gbWF5IHVzZSBzb21lIG9mIHRoZSBwaW5zIGJ5IHRoZW1zZWx2ZXMsIHN1Y2ggYXMKcHJvdmlkaW5nIFNDSQo+ID4gPj4gKFN5c3RlbSBDb250cm9sIEludGVycnVwdCkgZnJvbSB0aGUgZW1iZWRkZWQgY29udHJvbGxlci4gVGhlIGRyaXZlciBtYXNrcwo+ID4gPj4gYWxsIGludGVycnVwdHMgYXQgcHJvYmUgdGltZSB3aGljaCBwcmV2ZW50cyB0aG9zZSBwaW5zIGZyb20gdHJpZ2dlcmluZwo+ID4gPj4gaW50ZXJydXB0cyBwcm9wZXJseS4KPiA+ID4+Cj4gPiA+PiBGaXggdGhpcyBi
 eSBub3QgbWFza2luZyBhbGwgaW50ZXJydXB0cyBhdCBwcm9iZSAtLSBpdCBzaG91bGQgYmUKZW5vdWdoIGp1c3QKPiA+ID4+IHRvIGNsZWFyIHRoZSBzdGF0dXMgcmVnaXN0ZXIuCj4gPiA+Pgo+ID4gPj4gUmVwb3J0ZWQtYnk6IFl1IEMgQ2hlbiA8eXUuYy5jaGVuIDxhdD4gaW50ZWwuY29tPgo+ID4gPj4gU2lnbmVkLW9mZi1ieTogTWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmcgPGF0PiBsaW51eC5pbnRlbC5jb20+Cj4gPiA+Cj4gPiA+IFBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaCBmb3Igbm93LiBJdCB0dXJuZWQgb3V0IHRvIGJlIGNhdXNpbmcgc3B1cmlvdXMKPiA+ID4gaW50ZXJydXB0cyBvbiBhbm90aGVyIHBsYXRmb3JtLgo+ID4gPgo+ID4gPiBJJ2xsIG5lZWQgdG8gcmV0aGluayBob3cgdG8gZml4IHRoZSByZXBvcnRlZCBpc3N1ZS4KPiA+IAo+ID4gTG9va3MgbGlrZSBhIGNhc2Ugb2YgImVtYmVkIG1vcmUgbWFnaWMga25vd2xlZGdlIiBpbiB0aGUgZHJpdmVyIDovCj4gPiAKPiA+IEl0IG5lZWRzIHRvIGtub3cgd2hhdCBwbGF0Zm9ybSBpdCBpcyBydW5uaW5nIG9uLCBhbmQgb25seSBsZWF2ZSBzcGVjaWZpYwo+ID4gYml0cyB1bm
 1hc2tlZCBvbiB0aGVzZSBzcGVjaWZpYyBwbGF0Zm9ybXMuIFJpZ2h0PyBUaGVyZWJ5Cj4gPiB0b3NzaW5nIGFsbCBvZiB0aGUgYWNwaV9kZXZpY2VfaWQgbWF0Y2hpbmcgYW5kIGFic3RyYWN0aW9uIG91dAo+ID4gb2YgdGhlIHdpbmRvdy4KPiAKPiBUaGF0J3MgcmlnaHQuCj4gCj4gV2Ugc3RpbGwgaGF2ZSBmZXcgb3B0aW9ucyBsZWZ0LCBsaWtlIHVzaW5nIEFDUEkgX0FFSSAoQUNQSSBHUElPCj4gdHJpZ2dlcmVkIGV2ZW50cykgZm9yIHRoaXMgb3IgYWRkaW5nIEdQSU8gaW50ZXJydXB0IHN1cHBvcnQgZGlyZWN0bHkgdG8KPiB0aGUgRUMgZHJpdmVyLgoKQXJlIHRoZXJlIGFueSB1cGRhdGVzIG9uIHRoaXMgcHJvYmxlbT8gSSBjYW1lIHRocm91Z2ggdGhpcyB3aGlsZSBkb2luZwpoYXJkd2FyZSBlbmFibGVtZW50IGZvciBhIGxhcHRvcCwgYW5kIHRoZSBzeW1wdG9tcyB3ZXJlIHRoZSBicmlnaHRuZXNzCmNvbnRyb2wga2V5cyBzdG9wIHdvcmtpbmcgd2hlbiB0aGlzIG1vZHVsZSB3YXMgbG9hZGVkLiBUaGlzIHBhdGNoIGZpeGVzIHRoZQpwcm9ibGVtIG9uIHRoYXQgc3BlY2lmaWMgcGxhdGZvcm0uCgpJJ20gaGFwcHkgdG8gdGVzdCBvciBoZWxwIG91
 dCB3aXRoIGEgYmV0dGVyIHN1aXRlZCBmaXggaWYgZ2l2ZW4gc29tZSBndWlkYW5jZS4KCkJlc3QgcmVnYXJkcywKClBTOiBwbGVhc2Uga2VlcCBtZSBjb3BpZWQgaW4gdGhlIHRocmVhZCBzaW5jZSBJIGRvIG5vdCBzaWduIGxpbnV4LWdwaW8gbm9yIExLTUwuCgotLQpKb8OjbyBQYXVsbyBSZWNoaSBWaXRhCmh0dHA6Ly9hYm91dC5tZS9qcHJ2aXRh

