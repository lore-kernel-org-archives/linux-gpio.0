From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: fix gpio-hog related boot issues
Date: Thu, 12 Apr 2018 14:48:56 +0200
Message-ID: <CACRpkdacDjzF=CR59by8Zd44wJD12Sr5FSTd=Ph_eSH2QYZudA@mail.gmail.com>
References: <20180328180705.29147-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180328180705.29147-1-chunkeey@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

T24gV2VkLCBNYXIgMjgsIDIwMTggYXQgODowNyBQTSwgQ2hyaXN0aWFuIExhbXBhcnRlciA8Y2h1
bmtlZXlAZ21haWwuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgYnkg
YWRkaW5nIHRoZSAiZ3Bpby1yYW5nZXMiIHByb3BlcnR5Cj4gdG8gdGhlIHBpbmN0cmwgZGV2aWNl
IG5vZGUgb2YgYWxsIHVwc3RyZWFtIFFjb20gU29DLCBzbyB0aGUKPiByYW5nZXMgYXJlIGFkZGVk
IGJ5IG9mX2dwaW9jaGlwX2FkZF9waW5fcmFuZ2UoKSwgd2hpY2ggaXMKPiBjYWxsZWQgYnkgb2Zf
Z3Bpb2NoaXBfYWRkKCkgYmVmb3JlIHRoZSBjYWxsIHRvCj4gb2ZfZ3Bpb2NoaXBfc2Nhbl9ncGlv
cygpIGhhcHBlbnMuZ3Bpb2NoaXBfYWRkX3Bpbl9yYW5nZSgpIGlzIGxvbmdlcgo+IG5lZWRlZCBh
bmQgcmVtb3ZlZCAodG8gcHJldmVudCBhZGRpbmcgdGhlIHNhbWUgZW50cnkgdG8gdGhlCj4gcGlu
Y3RybGRldl9saXN0IHR3aWNlKS4KClRoYXQncyBwcmV0dHkgbmVhdCEKCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgZ3Bpby1jb250cm9sbGVyOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdw
aW8tcmFuZ2VzID0gPCZ0bG1tX3Bpbm11eCAwIDAgOTA+OwoKbmljZSEKCj4gLSAgICAgICByZXQg
PSBncGlvY2hpcF9hZGRfcGluX3JhbmdlKCZwY3RybC0+Y2hpcCwgZGV2X25hbWUocGN0cmwtPmRl
diksIDAsIDAsIGNoaXAtPm5ncGlvKTsKPiAtICAgICAgIGlmIChyZXQpIHsKPiAtICAgICAgICAg
ICAgICAgZGV2X2VycihwY3RybC0+ZGV2LCAiRmFpbGVkIHRvIGFkZCBwaW4gcmFuZ2VcbiIpOwo+
IC0gICAgICAgICAgICAgICBncGlvY2hpcF9yZW1vdmUoJnBjdHJsLT5jaGlwKTsKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIH0KCklmIHlvdSBpbnN0ZWFkIG9mIGRlbGV0
ZWluZyB0aGlzLCBqdXN0IHdyYXAgaXQgaW5zaWRlCnNvbWV0aGluZyBsaWtlOgoKaWYgKCFvZl9w
cm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJncGlvLXJhbmdlcyIpIHsKICAoLi4uKQp9CgpZb3Ugd2ls
bCBzdGF5IGNvbXBhdGlibGUgd2l0aCBlbGRlciBkZXZpY2UgdHJlZXMsIHNvbHZpbmcgQmrDtnJu
cwppc3N1ZS4gWW91IHdpbGwgb25seSBiZSBhZGRpbmcgaG9ncyB0byBuZXdlciBkZXZpY2UgdHJl
ZXMgd2l0aAp0aGUgcmFuZ2VzIGRlZmluZWQgYW55d2F5LgoKQmUgZ2VuZXJlb3VzIHdpdGggY29t
bWVudHMgaW4gdGhlIGNvZGUgaWYgeW91IGNob29zZSB0aGlzCmFwcHJvYWNoIHNvIGV2ZXJ5b25l
IHJlYWxpemUgd2hhdCBpcyBnb2luZyBvbi4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
